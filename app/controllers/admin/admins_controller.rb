class Admin::AdminsController < AdminController
  before_action :check_admin_access
  before_action :admin, only: :edit

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to admin_admins_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if admin.update(admin_params.merge(passowrd_requirements))
      redirect_to admin_admins_path
    else
      render :edit
    end
  end

  def destroy
    admin.destroy
  end

  private

  def admin
    @admin ||= Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :password, :password_confirmation, :role, :login)
  end

  def passowrd_requirements
    admin_params[:password].present? ? {} : { skip_password_validation: true }
  end
end
