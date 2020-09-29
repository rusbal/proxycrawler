module ProductsHelper
  def display_price(product)
    price = "#{product.price_symbol}#{product.price}"
    if product.price_crossed_out && product.price_crossed_out > 0.0
      price += " <strike>#{product.price_crossed_out}</strike>"
    end
    price.html_safe
  end
end
