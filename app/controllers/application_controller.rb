class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find session[:user_id] if session[:user_id]
  end
  helper_method :current_user

  def coach?
    current_user.type == "Coach"
  end
  helper_method :coach?
end
