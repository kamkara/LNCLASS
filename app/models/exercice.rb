class Exercice < ApplicationRecord
  belongs_to :course
  belongs_to :user
  has_rich_text :content

  #VALIDATIONS
  validates :title,
            :content,
            :author,
            :slug, presence: :true
#search_id  #the id for exercice PDF can permitted to find exercice throught this code.

  #SLUG
  extend FriendlyId
    friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
end
