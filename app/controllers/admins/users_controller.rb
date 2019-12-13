class Admins::UsersController < AdminController
  def index
    @users = User.all
  end
end
