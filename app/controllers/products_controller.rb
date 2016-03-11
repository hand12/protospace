class ProductsController < ApplicationController
  def new
    @product = Product.new
    @product.product_images.build
  end

  def create
    Product.create(create_params)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(update_params)
  end


  private

  def create_params
    params.require(:product).permit(
      :title,
      :catchcopy,
      :concept,
        product_images_attributes: [:id, :image]
      )
  end

  def update_params
    params.require(:product).permit(
      :title,
      :catchcopy,
      :concept,
        product_images_attributes: [:id, :image, :_destroy]
      )
  end

end
