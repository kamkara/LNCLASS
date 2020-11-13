class Course < ApplicationRecord
  belongs_to :user
  belongs_to :level
  belongs_to :material
  #has_rich_text :content

#VALIDATIONS
  #PRESENTE
  validates :title,
            :content,
            :slug,
            :level_id,
            :material_id,
            :author, presence: true

  #SLUG
  extend FriendlyId
    friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
end
