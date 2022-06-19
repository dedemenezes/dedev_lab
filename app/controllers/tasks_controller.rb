class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(created_at: :asc)
    @assignment = Assignment.new
    @users = User.all
  end

  def show
    @task = Task.find(params[:id])
    @assignment = Assignment.new
    @checklist_items_completed = @task.checklist_items_completed
  end
end
