class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :birth_date, :date
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
