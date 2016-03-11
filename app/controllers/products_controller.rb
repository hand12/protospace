class ProductsController < ApplicationController
  def new
    @product = Product.new
    @product.product_images.build
  end
end
