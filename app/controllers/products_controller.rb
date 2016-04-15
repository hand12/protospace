class ProductsController < ApplicationController
  def new
    @product = Product.new
    @product.product_images.build
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @likes = Like.where(product_id: params[:id])
  end

  def create
    @product = Product.new(create_params)
    if @product.save
      redirect_to :root
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @product_image = @product.product_images.build
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(update_params)
      redirect_to :root
    else
      render :edit
    end
  end


  private
  def create_params
    params.require(:product).permit(:title, :catchcopy, :concept, product_images_attributes: [:image, :status]
      )
  end

  def update_params
    params.require(:product).permit(:title, :catchcopy, :concept, product_images_attributes: [:image, :status, :id, :_destroy]
      )
  end

end
