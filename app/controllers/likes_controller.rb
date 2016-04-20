class LikesController < ApplicationController
  def create
    @like = Like.create(like_params)
    @product = Product.find(like_params[:product_id])
  end

  def destroy
    Like.find(like_params[:id]).destroy
    @product = Product.find(like_params[:product_id])
  end

  private
  def like_params
    params.permit(:product_id, :id).merge(user_id: current_user.id)
  end
end
