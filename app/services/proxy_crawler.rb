class ProxyCrawler < ApplicationService

  def initialize(request_url)
    @request_url = request_url
  end

  def call
    ActiveRecord::Base.transaction do
      process
    end
  rescue => error
    debug(self, error)
    false
  end

  private

  def process
    a = @request_url.response_body
    binding.pry
    true
  end

end
