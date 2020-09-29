class ResponseBodyProcessor < ApplicationService

  def initialize(body)
    @body = body
    @asin = nil
  end

  def call
    ActiveRecord::Base.transaction do
      process
    end
  rescue => error
    debug(self, error)
    false
  end

  private

  def process
    doc = Nokogiri::HTML.parse(@body)

    doc.css("[data-asin]").each do |asin|
      process_asin(asin)
    end

    true
  end

  def process_asin(asin)
    @asin = asin

    ap = find_by_asin

    return unless ap

    result = ap.update(
      name: extract_name,
      price_symbol: extract_price_symbol,
      price: extract_price,
      price_crossed_out: extract_price_crossed_out,
      image_url: extract_image_url,
      rating: extract_rating,
      review_count: extract_review_count
    )
  end

  def find_by_asin
    amazon_asin = extract_amazon_asin

    if amazon_asin == ""
      return false
    end

    product = AmazonProduct.find_by(amazon_asin: amazon_asin)
    return product if product.present?

    AmazonProduct.create(amazon_asin: amazon_asin, name: extract_name, price: extract_price)
  end

  def extract_amazon_asin
    @asin.attributes["data-asin"].value
  end

  def extract_name
    @extract_name ||= @asin.css('[data-click-el="title"]').text
    return @extract_name if @extract_name.present?

    @extract_name ||= @asin.css("h2").text.strip
    return @extract_name if @extract_name.present?

    ""
  end

  def extract_price_symbol
    val = @asin.css(".a-price-symbol").text
    return val if val.present?
    
    ""
  end

  def extract_price
    return @extract_price if @extract_price.present?

    whole = @asin.css(".a-price .a-price-whole").text.gsub(".", "")
    fraction = @asin.css(".a-price .a-price-fraction").text

    if whole.present?
      if fraction.present?
        @extract_price = "#{whole}.#{fraction}".to_d
      else
        @extract_price = whole.to_d
      end
      return @extract_price
    end

    nil
  end

  def extract_price_crossed_out
    val = @asin.css(".a-price .a-offscreen").text
    return val if val.present?
    
    nil
  end

  def extract_image_url
    val = @asin.css("img").attribute("src").try(:value)
    return val if val.present?
    
    nil
  end

  def extract_rating
    ratings = @asin.css("[data-rating]")
    return if ratings.nil?

    ratings.each do |rating|
      val = rating.attributes["data-rating"].value
      return val if val.present?
    end
  end

  def extract_review_count
    reviews = @asin.css("a[href$='customerReviews']").text
    if reviews.present?
      return reviews.strip.gsub(",", "").to_i
    end
  end

end
