class SessionsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    if admin && admin.authenticate(params.dig(:admin, :password))
      session[:admin] = admin.id
      redirect admins_users_path
    else
      render new_sessions_path
    end
  end

  def delete

  end

  private

  def admin
    @admin ||= Admin.find_by(login: params.dig(:admin, :login))
  end
end
