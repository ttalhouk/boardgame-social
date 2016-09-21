class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    if @user.nil?
      flash.now[:alert] = "User Not Found"
      redirect_to users_path
    end
  end
end
