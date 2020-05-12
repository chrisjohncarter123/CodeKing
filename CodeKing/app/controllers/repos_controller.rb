class ReposController < ApplicationController
    before_action :require_login
    #skip_before_action :require_login, only: [:index]



    def index
        if !current_user
            redirect_to new_user_path
        end

        @created_repos = created_repos
        
    end
    def new
        @repo = Repo.new

    end

    def create
        @repo = Repo.new(repo_params)
        @repo.creator_id = current_user.id
        

        if @repo.save
          redirect_to @repo, notice: 'Repo created.'
        else
          render :new 
        end

    end

    def show
        @repo = Repo.find(params[:id])

    end

    def edit

    end

    def update
        if @repo.update(repo_params)
            redirect_to @repo, notice: 'Repo updated.'
        else
            render :edit
        end


    end

    def destroy
        byebug
        repo.destroy
        redirect_to repos_path


    end

    

    

    private


    def repo_params
        params.require(:repo).permit(:name)
    end

    
end
