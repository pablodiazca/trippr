class PostsController < ApplicationController

  layout 'application'

  before_action :authenticate_user!

  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    user = User.find params[:user_id]
    @posts = user.posts
  end

  def show
    
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @user = current_user
    
    @post.user_id = current_user.id

    if @post.save
      redirect_to user_posts_path(current_user.id)
    else
      redirect_to new_post_path
    end

  end

  def edit
    
  end

  def update
   
    if @post.update post_params
      redirect_to post_path
    else
      redirect_to edit_post_path
    end
  end

  def destroy

    @post.destroy
    
    redirect_to post_index_path  
  end

  private

  def find_post
    @post = Post.find params[:id]
  end

  def post_params
    params.require(:post).permit(:title, :content, :country)
  end
end

