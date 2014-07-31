class TasksController < ApplicationController
  def index
    @tasks = Task.order(:index)
    @current_task = @tasks.first
    @task_accomplishment = TaskAccomplishment.new user: User.new
    @accomplished_tasks = current_user.present? ? current_user.tasks : []
  end
end
