class HomeController < ApplicationController
  def index
    if !current_user
      redirect_to new_user_path
    end

    @user = current_user
  end
end
