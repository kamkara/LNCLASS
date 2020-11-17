class CreateExercices < ActiveRecord::Migration[6.0]
  def change
    create_table :exercices, id: :uuid do |t|
      t.string :title
      t.text :content
      t.string :author
      t.string :search_id
      t.string :slug
      t.references :course, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
