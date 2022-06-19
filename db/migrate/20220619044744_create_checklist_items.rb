class CreateChecklistItems < ActiveRecord::Migration[6.1]
  def change
    create_table :checklist_items do |t|
      t.string :content
      t.references :task, null: false, foreign_key: true
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
