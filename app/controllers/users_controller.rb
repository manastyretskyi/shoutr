class UsersController < ApplicationController

  def show
    @user = User.find_by!(username: params[:id])
    @timeline = Timeline.new [@user], page: params[:page]
  end

end
