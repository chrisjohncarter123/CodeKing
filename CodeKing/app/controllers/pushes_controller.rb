class PushesController < ApplicationController
    before_action :require_login
    #skip_before_action :require_login, only: [:index]

    def index
        if params[:repo_id]
            @repo = Repo.find(params[:repo_id])
            @pushes = @repo.pushes
           
        else
            @pushes = created_pushes
        end
    end

    def show
        @push = Push.find(params[:id])
    end


    def new
        @push = Push.new
        #@user = current_user
        #@created_repos = Repo.where(creator_id: @user.id)
        #@created_pushes = Push.where(user_id: @user.id)
    end



    def create

        if !push_params[:message]  || !push_params[:content]
            redirect_to :new 

        else
    
            @push = Push.new

            @push.repo_id = push_params[:repo_id]
            @push.user_id = current_user.id

            @push.message = push_params[:message]
            @push.content = push_params[:content]

           # byebug


            if @push.save
                redirect_to @push, notice: 'Push created.'
            else
                redirect_to new_repo_push_path(push_params[:repo_id])
                # :new 
            end
        end

    end

    private


    def push_params
        params.require(:push).permit(:repo_id, :user_id, :message, :content)
    end


end
