class Products::NewestController < ApplicationController
  def index
    @products = Product.order("created_at ASC").page(params[:page]).per(10)
  end
end
