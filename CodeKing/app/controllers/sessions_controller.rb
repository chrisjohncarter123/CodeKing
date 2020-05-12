class SessionsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create

    if auth_hash = request.env["omniauth.auth"]
      #logged in with omniauth


      #100% trusted person's email
      oauth_email = request.env["omniauth.auth"]["info"]["email"] 
      if user = User.find_by_email(oauth_email)
        #seen this user before, just log them in
        session[:user_id] = user.id
        redirect_to root_url, notice: "Welcome back!"
      else
        #i know who the person is, but it is the first time they
        #came to this application

        #I could also store the provider and their userID
        user = User.new(:email => oauth_email, :password => SecureRandom.hex)
        if user.save
          session[:user_id] = user.id
          redirect_to root_url, notice: "Welcome back!"
        else
          raise user.errors.full_message.inspect
        end
      end


      

    else
      #normal login with username and password
      user = User.find_by_email(params[:email])

      if !user
        redirect_to login_path, notice: "Invalid credentials."
      elsif !user.authenticate(params[:password])
        redirect_to login_path, notice: "Invalid credentials."
      else
        session[:user_id] = user.id
        redirect_to root_url, notice: "Welcome back!"
      end

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