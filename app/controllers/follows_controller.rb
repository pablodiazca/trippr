class FollowsController < ApplicationController

  layout 'application'

  def index
    
    @user = User.find(params[:user_id])

  end
  
  def create 
    @user = User.find(params[:user_id])

    if current_user
      if current_user == @user
        flash[:error] = "You cannot follow yourself."
      else
        current_user.follow(@user)
        flash[:notice] = "You are now following #{@user.full_name}."

        respond_to do |format|
            format.html { redirect_to user_posts_path(@user)}
            format.js   {  }
        end
      end

    else
      flash[:error] = "You must <a href='/users/sign_in'>login</a> to follow #{@user.full_name}."
    end 
  end

  def destroy
    @user = User.find(params[:user_id])
  
    if current_user
      current_user.stop_following(@user)
      flash[:notice] = "You are no longer following #{@user.full_name}."

      respond_to do |format|
            format.html { redirect_to user_posts_path(@user) }
            format.js   {  }
        end
    else
      flash[:error] = "You must <a href='/users/sign_in'>login</a> to unfollow #{@user.full_name}."
    end
  end
end
