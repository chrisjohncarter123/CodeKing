class ApplicationController < ActionController::Base
  helper_method :current_user, :require_login, :set_user, :created_repos, :created_pushes
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end



  def require_login
    return redirect_to new_user_path unless session.include? :user_id
  end

  def set_user
    @user = User.find(params[:id])
  end

  def created_repos
    return Repo.where(creator_id: current_user.id)
  end

  def created_pushes
    return Push.where(user_id: current_user.id)
  end

  def logged_in
    return (session.include? :user_id) == true
  end
end