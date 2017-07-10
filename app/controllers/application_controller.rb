class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_cookie

  private

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_profile
  	@current_profile = current_user.profile
  end

  def current_cookie
  	cookies[:current_user] = current_user
  end

  helper_method :current_user, :current_profile, :room
  
end
