

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

#Birthday
#validates :birthday, presence: true
  #enum
#enum gender: [:male, :female]

  #UNIQUENESS
   validates :contact,
              :matricule,
             :email, uniqueness: true
#CONSTANTE
CLASSROOM= ["1", "2", "3", "4", "5" "6", "7", "8", "9", "10", "11", "12"]

#SLUG
  #build username

  def username
    "#{first_name} #{last_name}"
  end

  extend FriendlyId
    friendly_id :last_name, use: :slugged

  def should_generate_new_friendly_id?
    last_name_changed?
  end
end
