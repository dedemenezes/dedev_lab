class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.references :task, null: false, foreign_key: true
      t.references :contributor, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
