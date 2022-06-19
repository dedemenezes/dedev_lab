class ChecklistItemsController < ApplicationController
  def index
    # binding.pry
    # @checklist_items = ChecklistItem.where(params[:order_by])
    @task = Task.find(params[:task_id])
    @checklist_items = ChecklistItem.where(task: @task).order("checklist_items.#{params[:order_by].downcase} DESC")
    respond_to do |format|
      format.html
      format.text { render partial: 'checklist_items/index', locals: { task: @task, checklist_items: @checklist_items  },formats: [:html] }
    end
  end
end
