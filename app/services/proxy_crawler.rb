class ProxyCrawler < ApplicationService

  def initialize(request_url)
    @request_url = request_url
  end

  def call
    process
  rescue => error
    debug(self, error)
    false
  end

  private

  def process
    ResponseBodyProcessor.call(@request_url.response_body)
  end

end
