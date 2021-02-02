class PostsController < ApplicationController

  def create
    Post.create(post_params)
    
    redirect_to root_path
  end

  def show
    if user_signed_in?   
      @post = Post.find(params[:id])
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

  def post_params
    params.require(:post).permit(:description, :user_id, :image)
  end
  
end
