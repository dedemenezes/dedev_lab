class TasksController < ApplicationController
  def index
    @tasks = Task.joins(:manager).all
    @assignment = Assignment.new
    @users = User.all
  end
end
