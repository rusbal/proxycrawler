class RequestUrlsController < ApplicationController
  def show
    @request_urls = RequestUrl.all
  end
end
