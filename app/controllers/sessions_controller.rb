class SessionsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    if admin && admin.authenticate(params.dig(:admin, :password))
      session[:admin] = admin.id
      redirect_to admin_users_path
    else
      redirect_to new_sessions_path
    end
  end

  def destroy
    session.clear
    redirect_to new_sessions_path
  end

  private

  def admin
    @admin ||= Admin.find_by(login: params.dig(:admin, :login))
  end
end
