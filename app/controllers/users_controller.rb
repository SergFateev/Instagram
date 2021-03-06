class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update]
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :phone, :bio,
                               :website, :name, :image)
  end
  
end
