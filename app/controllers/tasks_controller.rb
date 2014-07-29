class TasksController < ApplicationController
  def index
    @task = Task.order(:index).first
    @tasks_users = TasksUsers.new
  end
end
