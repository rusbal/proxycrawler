Rails.application.routes.draw do
  root "dashboard#index"

  resource :request_urls
end
