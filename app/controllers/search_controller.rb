class SearchController < ApplicationController

  layout 'application'

  def index
    @q = Post.search(params[:q])
  end

  def show
    @q = Post.search(params[:q])

    @posts = @q.result
  end

end