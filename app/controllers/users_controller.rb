class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  def show
    @products = @user.products.page(params[:page]).per(10)
  end

  def edit

  end

  def update
    if @user.update(update_params)
      redirect_to :root, notice: 'Your user infomation was successfully updated'
    else
      render :edit
    end
  end

  private
  def update_params
    params.require(:user).permit(:name, :avatar, :profile, :work, :member)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
