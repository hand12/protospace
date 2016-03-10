class UsersController < ApplicationController

  def new
    @user = User.new
    @user.products.build
  end


  private
  def user_params
    params.require(:user).permit(:name, :profile, :image, :position, :occupation, :email, :password, products_attributes: [:id, :title, :catchcopy, :concept])
  end
end
