class ChangeCompletedDefaultInTasks < ActiveRecord::Migration[6.1]
  def change
    change_column_default :tasks, :completed, true
  end
end
