class ApplicationController < ActionController::Base
  helper_method :current_user, :require_login, :created_repos, :created_pushes
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

  def created_repos
    return Repo.where(creator_id: current_user.id)
  end

  def created_pushes
    return Push.where(user_id: current_user.id)
  end
end