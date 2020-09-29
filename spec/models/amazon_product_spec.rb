require 'rails_helper'

RSpec.describe AmazonProduct, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :amazon_asin }
    it { is_expected.to validate_presence_of :name }

    it "validates rating to range 1..5" do
      expect{ create(:amazon_product, rating: 0.9) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "validates uniqueness of amazon_asin" do
      amazon_asin = "1234567890"
      create(:amazon_product, amazon_asin: amazon_asin)
      expect{ create(:amazon_product, amazon_asin: amazon_asin) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
