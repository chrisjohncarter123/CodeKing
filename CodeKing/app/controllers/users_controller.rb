class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #skip_before_action :require_login, only: [:index]

  def index
    redirect_to new_user_path
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User created.'
    else
      render :new 
    end
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
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
