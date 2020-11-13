class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses, id: :uuid do |t|
      t.string :title
      t.string :content
      t.string :author
      t.string :memo
      t.string :slug
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :level, null: false, foreign_key: true, type: :uuid
      t.references :material, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
