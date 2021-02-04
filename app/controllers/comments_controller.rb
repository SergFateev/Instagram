class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.commets.create(comment_params)

    redirect_to post_path(@post)
  end

  def show
      @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
  
end
