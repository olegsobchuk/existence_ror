class AdminController < ApplicationController
  layout 'admin'

  before_action :check_admin

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin])
  end
  helper_method :current_admin

  private

  def check_admin
    redirect_to new_sessions_path unless current_admin
  end

  def check_admin_access
    redirect_to admin_activities_path unless current_admin.hight?
  end
end
