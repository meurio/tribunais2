class TasksController < ApplicationController
  def index
    @tasks = Task.order(position: :asc)
    @task_accomplishment = TaskAccomplishment.new user: User.new

    @accomplished_tasks = current_user.present? ? current_user.tasks : []
    @unaccomplished_tasks = current_user.present? ? current_user.unaccomplished_tasks : @tasks
    
    @current_task = @unaccomplished_tasks.first
  end
end
