class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception
  include Error::ErrorHandler
  
  def current_user
    super || Guest.new
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password)}
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :password, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password)}
  end

end
