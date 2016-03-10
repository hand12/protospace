class UsersController < ApplicationController

  def new
    @user = User.new
  end


  private
  def user_params
    params.require(:user).permit(:name, :profile, :avatar, :position, :occupation, :email, :password)
  end
end
