class ProductsController < ApplicationController
  def new
    @product = Product.new
    # 3.times { @product.product_images.build }
    @product.product_images.build
  end

  def index
  end

  def create
    binding.pry
    Product.create(create_params)
    redirect_to :action => 'index'
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(update_params)
    redirect_to :action => 'index'
  end


  private
  def create_params
    params.require(:product).permit(:title, :catchcopy, :concept, product_images_attributes: [:image, :status]
      )
  end

  def update_params
    params.require(:product).permit(:title, :catchcopy, :concept, product_images_attributes: [:image, :status, :_destroy]
      )
  end

end
