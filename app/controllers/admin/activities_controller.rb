class Admin::ActivitiesController < AdminController
  def index
    @users = User.grouped_by_rank.sort
  end

  def update
    user.update(online: !user.online)
    send_notification
  end

  private

  def user
    @user ||= User.find(params[:id])
  end

  def send_notification
    ActionCable.server.broadcast('user_activity', { user_id: user.id, online: user.online })
  end
end
