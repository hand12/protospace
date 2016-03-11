class ProductsController < ApplicationController
  def new
    @product = Product.new
    @product.product_images.build
  end

  def create
    Product.create(create_params)
  end


  private

  def create_params
    params.require(:product).permit(
      :title,
      :catchcopy,
      :concept,
        addresses_attributes: [:id, :image]
      )
  end

end
