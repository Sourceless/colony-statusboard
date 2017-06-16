class TeamController < ApplicationController
  def index
    @users = User.all
  end
end
