class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show, :destroy]
  
  def create
    Post.create(post_params)
    
    redirect_to root_path, flash: { success: "Post was added" }
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    redirect_to post_path(@post)
  end
    
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:description, :user_id, :image)
  end
  
end
