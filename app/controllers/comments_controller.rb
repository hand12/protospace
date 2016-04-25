class CommentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    Comment.create(comment_params)
    @comments = @product.comments
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
