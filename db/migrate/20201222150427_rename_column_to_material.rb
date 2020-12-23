class RenameColumnToMaterial < ActiveRecord::Migration[6.0]
  def change
    rename_column :materials, :cycle, :level_ids
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
