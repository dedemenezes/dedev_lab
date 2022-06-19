class NotesController < ApplicationController
  def index
    @task = Task.find(params[:task_id])
    @notes = Note.where(task: @task)
  end

  def create
    @note = Note.new(note_params)
    @task = Task.find(params[:task_id])
    @note.task = @task
    @note.user = current_user
    if @note.save
      redirect_to task_path(@task, anchor: "note_#{@note.id}")
    else
      @assignment = Assignment.new
      render 'tasks/show', assignment: @assignment
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :rich_body)
  end
end
