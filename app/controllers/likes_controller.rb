class LikesController < ApplicationController
  before_action :authenticate_user!

  def index
    @shout = find_shout
  end

  def create
    current_user.like(shout)
    redirect_back fallback_location: root_path
  end

  def destroy
    current_user.unlike(shout)
    redirect_back fallback_location: root_path

  end

  private
  def shout
    @_shout ||= Shout.find(params[:id])
  end

  def find_shout
    @_shout ||= Shout.find(params[:shout_id])
  end
end
