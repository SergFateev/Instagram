class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show, :destroy]
  before_action :load_user
  
  def create
    Post.create(post_params)
    
    redirect_to root_path, flash: { success: "Post was added" }
  end

  def show
    if user_signed_in?   
      @post = Post.find(params[:id])
      @comment = @post.comments.order(created_at: :desc)
    else
      redirect_to new_user_session_path
    end 
  end
    
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    redirect_to user_path(current_user)
  end

  private

  def load_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:description, :user_id, :image)
  end
  
end
