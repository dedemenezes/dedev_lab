class TasksController < ApplicationController
  def index
    @tasks = Task.joins(:manager).all.order(created_at: :asc)
    @assignment = Assignment.new
    @users = User.all
  end

  def show
    @task = Task.find(params[:id])
    @assignment = Assignment.new
  end
end
