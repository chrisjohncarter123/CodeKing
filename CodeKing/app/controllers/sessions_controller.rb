class SessionsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create

    if(auth['uid'].nil?)
      #normal login

      user = User.find_by_email(params[:email])

      if(!(User.find_by_email(params[:email])))
        redirect_to login_path, notice: "Invalid credentials."
      elsif(!user.authenticate(params[:password]))
        flash.now[:alert] = "Invalid credentials."
        redirect_to login_path
      else
        session[:user_id] = user.id
        redirect_to root_url, notice: "Welcome back!"
      end

    else
      #omniauth login

      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
      end
   
      session[:user_id] = @user.id
   
      render 'welcome/home'


    end

  end
  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Goodbye for now."
  end

  private 

  def auth
    request.env['omniauth.auth']
  end
end