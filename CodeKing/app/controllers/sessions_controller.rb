class SessionsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create

    user = User.find_by_email(params[:email])

   # if(!user)
      #redirect_to login_path
   #   flash.now[:alert] = "Invalid credentials."
    #  render "new"
    if(!(User.find_by_email(params[:email])))
      redirect_to login_path, notice: "Invalid credentials."

    elsif(!user.authenticate(params[:password]))
      flash.now[:alert] = "Invalid credentials."
      redirect_to login_path
    else
      session[:user_id] = user.id
      redirect_to root_url, notice: "Welcome back!"
    end

  end
  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Goodbye for now."
  end
end