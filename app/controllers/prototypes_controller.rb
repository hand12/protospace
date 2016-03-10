class PrototypesController < ApplicationController
  def new
    @product = Product.new
    @product.product_image.build
  end
end
