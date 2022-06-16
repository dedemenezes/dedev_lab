class AddDetailsToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :expected_end_date, :datetime
    add_column :tasks, :capacity, :integer
  end
end
