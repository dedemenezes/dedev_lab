class AssignmentsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    contributors_ids = assignment_params[:contributor].reject(&:empty?)
    assignments = contributors_ids.map do |id|
      contributor = User.find(id)
      Assignment.new(contributor: contributor, task: @task)
    end
    if assignments.all? { |assignment| assignment.save }
      redirect_to task_path(@task)
    else
      @assignment = assignments.last
      flash[:alert] = assignments.map { |assignment| assignment.errors.messages }.uniq.join.capitalize
      render 'tasks/show', task: @task, assignment: @assignment
    end
  end

  def assignment_params
    params.require(:assignment).permit(contributor: [])
  end
end
