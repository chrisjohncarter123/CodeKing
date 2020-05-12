class HomeController < ApplicationController
  before_action :require_login

  def index

    @created_repos = created_repos
    @created_pushes = created_pushes

  end
end
