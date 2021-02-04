class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  
  def index
    @posts = Post.order(created_at: :desc)
    @users = User.find(current_user.id)
  end
end
