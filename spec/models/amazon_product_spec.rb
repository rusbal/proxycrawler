require 'rails_helper'

RSpec.describe AmazonProduct, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :price }
  end
end
