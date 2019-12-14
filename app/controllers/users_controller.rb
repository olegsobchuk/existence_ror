class UsersController < ApplicationController
  def index
    @users = User.grouped_by_rank.sort
  end
end
