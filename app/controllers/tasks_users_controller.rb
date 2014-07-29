class TasksUsersController < ApplicationController
  def create
    tasks_user_params[:user_attributes][:ip] = request.remote_ip
    @tasks_user = TasksUser.new tasks_user_params
    @tasks_user.save
    session[:user_id] = @tasks_user.user.id
    redirect_to root_path
  end

  private

  def tasks_user_params
    params.require(:tasks_user).permit(user_attributes: [:first_name, :last_name, :email])
  end
end
