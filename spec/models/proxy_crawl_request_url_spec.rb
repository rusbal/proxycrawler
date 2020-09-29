require 'rails_helper'

RSpec.describe ProxyCrawlRequestUrl, type: :model do

  describe "constant" do
    it "has PROXYCRAWL_ROOT" do
      expect(ProxyCrawlRequestUrl::PROXYCRAWL_ROOT).to eq "https://api.proxycrawl.com"
    end

    it "has PROXYCRAWL_SERVICE" do
      expect(ProxyCrawlRequestUrl::PROXYCRAWL_SERVICE).to eq "product=crawling-api"
    end

    it "has PROXYCRAWL_TOKEN" do
      expect(ProxyCrawlRequestUrl::PROXYCRAWL_TOKEN).to be_truthy
    end
  end

  it "can return proxy crawl url" do
    url = "https://www.amazon.com/s?k=drill+bit+set"

    proxy_crawl_url = ProxyCrawlRequestUrl.create(url: url)

    target_escaped_url = ERB::Util.url_encode(url)
    expected_url = "#{ProxyCrawlRequestUrl::PROXYCRAWL_ROOT}/" + \
      "?#{ProxyCrawlRequestUrl::PROXYCRAWL_SERVICE}" + \
      "&token=#{ProxyCrawlRequestUrl::PROXYCRAWL_TOKEN}" + \
      "&url=#{target_escaped_url}"

    expect(proxy_crawl_url.proxy_url).to eq expected_url
  end

end
