class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  def new
    @product = Product.new
    @product.product_images.build
  end

  def index
    @products = Product.order("likes_count DESC").page(params[:page]).per(10)
  end

  def show
    if user_signed_in?
      @like = @product.likes.find_by(user_id: current_user.id)
    end
    @comment = Comment.new
    @comments = @product.comments
  end

  def create
    @product = Product.new(create_params)
    if @product.save
      redirect_to :root, notice: "create a product!"
    else
      render :new
    end
  end

  def edit
    @product_image = @product.product_images.build
  end

  def update
    if @product.update(update_params)
      redirect_to :root, notice: "update a product!"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to :root, notice: "destroy a product!"
  end

  private
  def create_params
    params.require(:product).permit(:title, :catchcopy, :concept, product_images_attributes: [:image, :status]).merge(tag_list: params[:product][:tag], user_id: current_user.id)
  end

  def update_params
    params.require(:product).permit(:title, :catchcopy, :concept, product_images_attributes: [:image, :status, :id, :_destroy]
      )
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
