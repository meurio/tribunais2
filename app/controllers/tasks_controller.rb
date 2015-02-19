class TasksController < ApplicationController
  def index
    @tasks = Task.order(position: :asc)
    @task_accomplishment = TaskAccomplishment.new user: User.new

    @accomplished_tasks = current_user.present? ? current_user.tasks : []

    if current_user.present?
      @unaccomplished_tasks = current_user.unaccomplished_tasks.order(position: :asc)
    else
      @unaccomplished_tasks = @tasks
    end

    @current_task = @unaccomplished_tasks.first
  end
end
