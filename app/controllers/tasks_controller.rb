class TasksController < ApplicationController
  def index
    @tasks = Task.order(:index)
    @task = @tasks.first
    @task_accomplishment = TaskAccomplishment.new user: User.new
  end
end
