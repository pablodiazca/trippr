class CommentsController < ApplicationController

  before_action :find_post
  def create
    @comment = @post.comments.new comment_params

    @user = current_user

    @comment.user_id = current_user.id

    if @comment.save 
      redirect_to post_path(@post.id), notice: "Comment Created!"
    else
      redirect_to post_path(@post.id), alert: "Comment Not Created"
    end
  end

  def edit
    
  end

  def destroy
    @comment = Comment.find params[:id]

    @comment.destroy

    redirect_to post_path(@post.id), notice: "Comment Deleted!"
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_post
    @post = Post.find params[:post_id]
  end
end
