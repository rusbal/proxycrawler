class ProductsController < ApplicationController
  def index
    @products = AmazonProduct.all
  end
end
