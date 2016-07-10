class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  def show
    @products = current_user.products
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    current_user.update(update_params)
    redirect_to :root, notice: 'Your user infomation was successfully updated'
  end

  private
  def update_params
    params.require(:user).permit(:name, :avatar, :profile, :work, :member)
  end

end
