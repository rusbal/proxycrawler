class CrawlerController < ApplicationController
  def create
    if process_crawl
      redirect_to request_urls_url, notice: "Successfully crawled"
    else
      redirect_to request_urls_url, alert: @error
    end
  end

  private

  def process_crawl
    request_url = ProxyCrawlRequestUrl.find(params[:request_url_id])
    ProxyCrawler.call(request_url)

  rescue ActiveRecord::RecordNotFound
    @error = "Request URL not found"
    false

  rescue
    @error = "Unhandled error"
    false
  end
end
