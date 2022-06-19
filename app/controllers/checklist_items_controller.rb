class ChecklistItemsController < ApplicationController
  def index
    # binding.pry
    # @checklist_items = ChecklistItem.where(params[:order_by])
    @task = Task.find(params[:task_id])
    @checklist_items = ChecklistItem.where(task: @task).order("checklist_items.#{params[:order_by].downcase} DESC")
    respond_to do |format|
      format.html
      format.text { render partial: 'checklist_items/index', locals: { task: @task, checklist_items: @checklist_items  }, formats: [:html] }
    end
  end

  def update
    checklist_item = ChecklistItem.find(params[:id])
    checklist_item.update(checklist_item_params)
    @task = checklist_item.task
    @assignment = Assignment.new
    @checklist_items_completed = @task.checklist_items_completed
    respond_to do |format|
      format.html { redirect_to movies_path }
      format.text {
        render(
          partial: "tasks/task",
          locals: {
            task: @task,
            assignment: @assignment,
            checklist_items_completed: @checklist_items_completed
          },
          formats: [:html]
        )
      }
    end
  end

  private

  def checklist_item_params
    params.require(:checklist_item).permit(:completed)
  end
end
