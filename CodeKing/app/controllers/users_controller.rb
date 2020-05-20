class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def index
    redirect_to new_user_path
  end

  def show
  end

  def new
    if logged_in
      redirect_to root_path
    else
      @user = User.new
    end
  end



  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User created.'
      session[:user_id] = @user.id
    else
      render :new 
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User deleted.'
  end

  private


    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
