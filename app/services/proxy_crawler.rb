class ProxyCrawler < ApplicationService

  def initialize()
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
    true
  end

end
