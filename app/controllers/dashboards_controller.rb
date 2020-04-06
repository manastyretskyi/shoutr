class DashboardsController < ApplicationController
  def show
    @dashboard = Dashboard.new current_user, page: params[:page]
  end
end
