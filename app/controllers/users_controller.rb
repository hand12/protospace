class UsersController < ApplicationController
  def show
    @products = current_user.products.page(params[:page]).per(10)
  end

end
