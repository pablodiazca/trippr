class LikesController < ApplicationController

  before_action :find_post 

  def create
    @like = Like.new
    @user = current_user

    @like.post_id = @post.id
    @like.user_id = current_user.id

    respond_to do |format|
      if @like.save
        format.html { redirect_to post_path(@post.id), notice: 'Liked!'}
        format.js   {  }
      else
        format.html { redirect_to post_path(@post.id), alert: 'Not liked :('}
        format.js   {  }
      end
    end

  end

  def destroy
    @like = current_user.likes.find_by_id params[:id]

    respond_to do |format|
      if @like && @like.destroy
        format.html { redirect_to post_path(@post.id), notice: 'Unliked!'}
        format.js   { render }
      else
        format.html { redirect_to post_path(@post.id), alert: "Like NOT DESTROYED!!"}
        format.js   { render }
      end
    end 
  end

  private

  def find_post
    @post = Post.find params[:post_id]
  end
end
