class RequestUrlsController < ApplicationController
  def index
    @request_urls = RequestUrl.all
  end
end
