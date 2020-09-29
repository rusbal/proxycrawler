require 'rails_helper'

RSpec.describe RequestUrl, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :url }

    it "validates uniqueness of url" do
      url = "http://www.example.com"
      create(:request_url, url: url)

      dup = build(:request_url, url: url)
      dup.valid?
      expect(dup.errors.messages[:url].first).to eq("has already been taken")
    end
  end
end
