class Admin::UsersController < AdminController
  before_action :check_admin_access
  before_action :user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    if User.create(user_params)
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if user.update(user_params)
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def destroy
    user.destroy
    redirect_to admin_users_path
  end

  private

  def user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :position, :rank, :level)
  end
end
