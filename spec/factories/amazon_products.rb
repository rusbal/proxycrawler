FactoryBot.define do
  factory :amazon_product do
    amazon_asin { "B004GIO0F8" }
    image_url { "MyString" }
    name { "MyString" }
    rating { "9.99" }
    review_count { 1 }
    price_symbol { "MyString" }
    price { "9.99" }
    price_crossed_out { "9.99" }
    size_base { "MyString" }
  end
end
