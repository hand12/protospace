class TopController < ApplicationController
  def index
    @products = Product.all
    @product = Product.find(90)
  end
end
