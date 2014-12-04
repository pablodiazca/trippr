class HomeController < ApplicationController
  layout 'application'
  
  def index
    @posts = Post.all
    @user = current_user
  end
end
