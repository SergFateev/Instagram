class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user.include(user)

    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
  
end
