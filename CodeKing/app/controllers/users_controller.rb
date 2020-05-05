class UsersController < ApplicationController

  #before_action :require_login
  #skip_before_action :require_login, only: [:new, :create, :show]


def index

end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create

    if(User.exists?(params[:user][:name]))
      #redirect
    
    else
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end

    

  end

  private
 
  def user_params
    params.require(:user).permit(
      :name,
      :height,
      :happiness,
      :nausea,
      :tickets,
      :password)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end


end
