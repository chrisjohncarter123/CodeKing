class ApplicationController < ActionController::Base
  helper_method :current_user, :require_login
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end



  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end