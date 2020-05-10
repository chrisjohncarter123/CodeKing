class HomeController < ApplicationController
  def index
    if !current_user || current_user.nil? || current_user == nil
      redirect_to new_user_path
    end

    @created_repos = created_repos#OLD: Repo.where(creator_id: current_user.id)
    @created_pushes = created_pushes#OLD: Push.where(user_id: current_user.id)

  end
end
