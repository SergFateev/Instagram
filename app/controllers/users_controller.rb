class UsersController < ApplicationController
  
  def show
    if user_signed_in?   
      @user = User.find(params[:id])
      @posts = @user.posts.order(created_at: :desc)
    else
      redirect_to new_user_session_path
    end 

  end

  def edit
    if user_signed_in?
      @user = User.find(params[:id])
    else
      redirect_to new_user_session_path
    end
  end

  def update
    current_user.update(user_params)
    redirect_to current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :phone, :bio,
                               :website, :name, :image)
  end
  
end
