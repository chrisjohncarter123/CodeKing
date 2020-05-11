class HomeController < ApplicationController
  before_action :require_login

  def index

    @created_repos = created_repos#OLD: Repo.where(creator_id: current_user.id)
    @created_pushes = created_pushes#OLD: Push.where(user_id: current_user.id)

  end
end
