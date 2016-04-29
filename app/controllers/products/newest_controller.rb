class Products::NewestController < ApplicationController
  def index
    @products = Product.order("created_at DESC").page(params[:page]).per(10)
  end
end
