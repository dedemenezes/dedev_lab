class AssignmentsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    contributors_ids = assignment_params[:contributor_id].reject(&:empty?)
    assignments = contributors_ids.map do |id|
      contributor = User.find(id)
      Assignment.new(contributor: contributor, task: @task)
    end
    assignments.each { |assignment| assignment.save }
    @tasks = Task.all
    render 'tasks/index', tasks: @tasks
  end

  def assignment_params
    params.require(:assignment).permit(contributor_id: [])
  end
end
