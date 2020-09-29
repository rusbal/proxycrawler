FactoryBot.define do
  factory :request_url do
    sequence(:url) { |n| "http://www.example.org/#{n}" }
  end
end
