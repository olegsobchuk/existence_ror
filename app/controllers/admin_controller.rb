class AdminController < ApplicationController
  layout 'admin'

  # before_action :check_admin

  def current_admin
    @admin ||= Admin.find_by(id: session[:admin])
  end
  helper_method :current_admin

  private

  def check_admin
    redirect_to sessions_new unless current_user
  end
end
