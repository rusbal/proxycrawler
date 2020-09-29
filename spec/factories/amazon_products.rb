FactoryBot.define do
  factory :amazon_product do
    amazon_asin { rand(1000000000..9999999999).to_s }
    sequence(:image_url) { |n| "http://www.example.org/image.#{n}.jpg" }
    name { "Product name" }
    rating { rand(1.0..5.0).round(1) }
    review_count { rand(1..5) }
    price_symbol { "$" }
    price { "9.99" }
    price_crossed_out { "19.99" }
  end
end
