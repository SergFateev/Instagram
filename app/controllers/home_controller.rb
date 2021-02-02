class HomeController < ApplicationController

  def index
    if user_signed_in?   
    @posts = Post.order(created_at: :desc)
    else
      redirect_to new_user_session_path
    end 
  end
end
