class Material < ApplicationRecord
  #RELATIONS
  belongs_to :user
  has_many :courses
  has_and_belongs_to_many :levels, dependent: :destroy

  #SLUG
  extend FriendlyId
    friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end

end
