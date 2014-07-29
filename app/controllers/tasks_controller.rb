class TasksController < ApplicationController
  def index
    @task = Task.order(:index).first
    @tasks_user = TasksUser.new user: User.new
  end
end
