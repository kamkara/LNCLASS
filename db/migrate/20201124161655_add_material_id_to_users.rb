class AddMaterialIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :material_id, :string
  end
end
