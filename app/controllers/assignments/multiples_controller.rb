class Assignments::MultiplesController < AssignmentsController
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
      flash[:alert] = assignments.map { |assignment| assignment.errors.messages }.uniq.join.capitalize
      render 'tasks/show', task: @task, assignment: assignments.last
    end
  end
end
