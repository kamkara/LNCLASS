class CreateJoinTableMaterialLevel < ActiveRecord::Migration[6.0]
  def change
    create_join_table :materials, :levels, id: :uuid do |t|
       t.index [:material_id, :level_id]
       t.index [:level_id, :material_id]
    end
  end
end
