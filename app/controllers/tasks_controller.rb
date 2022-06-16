class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @assignment = Assignment.new
    @users = User.all
  end
end
