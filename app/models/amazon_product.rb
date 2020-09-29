class AmazonProduct < ApplicationRecord
  validates :amazon_asin, presence: true
  validates :name, presence: true
  validates :price, presence: true
end
