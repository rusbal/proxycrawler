Rails.application.routes.draw do
  root "dashboard#index"

  resources :request_urls, only: :index do
    resources :crawler, only: :create
  end

  resources :products, only: :index
end
