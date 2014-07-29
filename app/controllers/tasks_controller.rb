class TasksController < ApplicationController
  def index
    @task = Task.order(:index).first
    @task_accomplishment = TaskAccomplishment.new user: User.new
  end
end
