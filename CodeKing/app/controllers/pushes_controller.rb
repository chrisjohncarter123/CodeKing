class PushesController < ApplicationController
    before_action :require_login
    #skip_before_action :require_login, only: [:index]

    def index
        if params[:repo_id]
            @repo = Repo.find(params[:repo_id])
            @pushes = @repo.pushes
           
        else
            @pushes = Push.all
        end

        
    end

    def show
        @push = Push.find(params[:id])
    end


    def new
        @push = Push.new
        @user = current_user
        @created_repos = Repo.where(creator_id: @user.id)
        @created_pushes = Push.where(user_id: @user.id)
    end



    def create
    
        @push = Push.new
        @push.message = params[:message]
        @push.content = params[:content]
        
        @push.user_id = current_user.id
       # byebug

        if params[:repo_id]
            @repo = Repo.find_by(id: params[:repo_id])

        else
            @repo = Repo.find_by(name: params[:push][:message])
        end

        @push.repo_id = @repo.id
       
        

        if @push.save
          redirect_to @push, notice: 'Push created.'
        else
          render :new 
        end



    end



    private


    def push_params
        params.require(:push).permit(:message, :content, :repo_id)
    end
end
