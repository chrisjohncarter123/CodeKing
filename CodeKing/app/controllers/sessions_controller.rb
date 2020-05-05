class SessionsController < ApplicationController


    def new
        @user = User.new

    end

    def show
        @user = User.find(params[:id])
    end

     def create
        @user = User.find_by(name: session_params[:user][:name])

        session[:user_id] = @user.id

        redirect_to user_path(@user)
    end

    def destroy
        session.delete :username
    end

    private
 
    def session_params
      params.require(:user).permit(:name, :password)
    end


end
