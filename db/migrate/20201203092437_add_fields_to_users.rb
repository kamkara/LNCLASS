class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :class_name, :string
    add_column :users, :birthday, :date
    add_column :users, :gender, :integer
  end
end
