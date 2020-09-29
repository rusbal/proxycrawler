class RequestUrl < ApplicationRecord
  validates :url, presence: true
end
