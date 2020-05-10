class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    auth = user.authenticate(params[:password])

    if user && auth
      session[:user_id] = user.id
      redirect_to root_url, notice: "Welcome back!"
    else
      flash.now[:alert] = "Invalid credentials."
      render "new"
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Goodbye for now."
  end
end