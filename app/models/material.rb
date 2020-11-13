class Material < ApplicationRecord
  belongs_to :user
  has_many :courses

  #CONSTANTS
  CYCLES= ["all","sec"]



  #SLUG
  extend FriendlyId
    friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end

end
