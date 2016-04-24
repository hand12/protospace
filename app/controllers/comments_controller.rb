class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    @comments = Comment.all
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
