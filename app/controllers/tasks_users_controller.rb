class TasksUsersController < ApplicationController
  def create
    user = User.find_by_email tasks_user_params[:user_attributes][:email]

    if user.nil?
      tasks_user_params[:user_attributes][:ip] = request.remote_ip
      user = User.create tasks_user_params[:user_attributes]
    end

    @tasks_user = TasksUser.create user_id: user.id, task_id: params[:task_id]

    session[:user_id] = @tasks_user.user.id
    redirect_to root_path
  end

  private

  def tasks_user_params
    params.require(:tasks_user).permit(user_attributes: [:first_name, :last_name, :email, :ip])
  end
end
