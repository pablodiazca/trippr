class CommentsController < ApplicationController

  before_action :find_post
  def create
    @comment = @post.comments.new comment_params

    @user = current_user

    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post.id), notice: "Comment Created!"}
        format.js   {  }
      else
        format.html { redirect_to post_path(@post.id), alert: "Comment Not Created"}
        format.js   {  }
      end
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to post_path(@post.id), notice: "Comment Deleted!"}
        format.js   {  }
      else
        format.html { redirect_to post_path(@post.id), notice: "Comment not Deleted!"}
        format.js   {  }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_post
    @post = Post.find params[:post_id]
  end
end
