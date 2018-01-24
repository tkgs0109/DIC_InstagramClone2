class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @favorite_blogs = @user.favorite_blogs
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      @favorite_blogs = @user.favorite_blogs
      render 'show'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :icon)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
