class ReposController < ApplicationController
    before_action :require_login
    #skip_before_action :require_login, only: [:index]



    def index
        if !current_user
            redirect_to new_user_path
        end
        
    end
    def new
        @repo = Repo.new

    end

    def create
        @repo = Repo.new(repo_params)

        if @repo.save
          redirect_to @repo, notice: 'Repo created.'
        else
          render :new 
        end

    end

    def show
        @repo = Repo.find(params[:id])

    end

    private


    def repo_params
        params.require(:repo).permit(:name)
    end

    
end
