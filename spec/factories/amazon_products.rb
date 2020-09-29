FactoryBot.define do
  factory :amazon_product do
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
