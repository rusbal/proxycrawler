class RequestUrl < ApplicationRecord
  validates :url, presence: true, uniqueness: true
end
