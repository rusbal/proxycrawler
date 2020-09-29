class AmazonProduct < ApplicationRecord
  validates :amazon_asin, presence: true, uniqueness: true
  validates :name, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 1.0, less_than_or_equal_to: 5.0 }, allow_nil: true
end
