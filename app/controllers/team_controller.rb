class TeamController < ApplicationController
  def index
    @users = User.order(email: :desc).all
  end
end
