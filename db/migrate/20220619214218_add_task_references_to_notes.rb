class AddTaskReferencesToNotes < ActiveRecord::Migration[6.1]
  def change
    add_reference :notes, :task, null: false, foreign_key: true, index: true
  end
end
