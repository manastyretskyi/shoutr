class FollowedUsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @user = User.find_by!(username: params[:user_id])
    @followed_users = @user.followed_users.paginate(page: params[:id])
  end

  def create
    user_to_follow = find_user
    current_user.follow user_to_follow
    redirect_to user_to_follow
  end

  def destroy
    user_to_unfollow = find_user
    current_user.unfollow user_to_unfollow
    redirect_to user_to_unfollow
  end

  private
  def find_user
    @_user ||= User.find_by!(username: params[:id])
  end
end
