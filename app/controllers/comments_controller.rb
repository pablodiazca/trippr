class CommentsController < ApplicationController
  def create
    @post = Post.find params[:post_id]
    @comment = @post.comments.new comment_params

    if @comment.save 
      redirect_to post_path(@post.id), notice: "Comment Created!"
    else
      redirect_to post_path(@post.id), alert: "Comment Not Created"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
