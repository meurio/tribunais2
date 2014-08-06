class TaskAccomplishmentsController < ApplicationController
  def create
    user = current_user || User.find_by_email(task_accomplishment_params[:user_attributes][:email])

    if user.nil?
      task_accomplishment_params[:user_attributes][:ip] = request.remote_ip
      user = User.create task_accomplishment_params[:user_attributes]
    end

    @task_accomplishment = TaskAccomplishment.create user_id: user.id, task_id: params[:task_id]

    session[:user_id] = @task_accomplishment.user.id
    redirect_to root_path(anchor: "tasks-panel")
  end

  private

  def task_accomplishment_params
    params.fetch(:task_accomplishment, {}).permit(user_attributes: [:first_name, :last_name, :email, :ip])
  end
end
