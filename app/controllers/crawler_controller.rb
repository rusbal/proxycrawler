class CrawlerController < ApplicationController
  def create
    if process_crawl
      redirect_to request_urls_url, notice: "Successfully crawled"
    else
      redirect_to request_urls_url, alert: "Failed crawl attempt"
    end
  end

  private

  def process_crawl
    ProxyCrawler.call
  rescue
    false
  end
end
