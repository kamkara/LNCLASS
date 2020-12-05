

class User < ApplicationRecord


  before_save do
    self.first_name = first_name.strip.squeeze(" ")
    self.last_name = last_name.strip.squeeze(" ")
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  #RELATIONS
  has_many :courses, dependent: :destroy
  has_many :materials
  has_many :levels
  has_many :exercices




  #PRESENTE
  validates :contact,
            :matricule,
            :city,
            :email, presence: true

   validates :last_name, presence: true,
                        length: { maximum: 30 },
                        format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }
  validates :first_name, presence: true,
                         length: { maximum: 30 },
                         format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }
  validates :gender, presence: true
  validates :username, presence: true,
  length: { maximum: 400 },
  format: { with: /\A[\w]+\z/},
  uniqueness: { case_sensitive: false }
#Birthday
#validates :birthday, presence: true
  #enum
#enum gender: [:male, :female]

  #UNIQUENESS
   validates :contact,
              :matricule,
             :email, uniqueness: true

  #build username
  def username
    "#{first_name} #{last_name}"
  end


  #SLUG
  extend FriendlyId
    friendly_id :username, use: :slugged

  def should_generate_new_friendly_id?
    username_changed?
  end
end
