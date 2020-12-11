class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable


#RELATIONS
  has_many :courses, dependent: :destroy
  has_many :materials
  has_many :levels
  has_many :exercices

#VALIDATIONS
  #PRESENTE
  validates :contact_phone,
            :city, :school_name,
            :email, presence: true

  validates :last_name,
            presence: true,
            length: { maximum: 30 },
            format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }
  validates :first_name,
            presence: true,
            length: { maximum: 30 },
            format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }
  validates :contact_phone, :contact_whatsapp, length: { maximum: 8 },
            format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }
  validatets :matricule, :email, :city, uniqueness: true
    #validates :gender, presence: true

  #Birthday
  #validates :birthday, presence: true
    #enum
  #enum gender: [:male, :female]

  #UNIQUENESS

#BEFORE ACTIONS

#Delete whitespaces before and after fields
before_save do
  self.contact_phone      = contact_phone.strip.squeeze(" ")
  self.contact_whatsapp   = contact_whatsapp.strip.squeeze(" ")
  self.first_name         = first_name.strip.squeeze(" ").downcase.capitalize
  self.last_name          = last_name.strip.squeeze(" ").downcase.capitalize
  self.city               = city.strip.squeeze(" ").downcase.capitalize
  self.school_name        = school_name.strip.squeeze(" ").downcase.capitalize
  #self.class_name         = class_name.strip.squeeze(" ").downcase.capitalize
end

#Build username
before_save  do
  self.username = "#{self.first_name} #{self.last_name}"
end

extend FriendlyId
  friendly_id :"#{self.username}" , use: :slugged

def should_generate_new_friendly_id?
  username_changed?
end

#CONSTANTE
CLASSROOM = ["1", "2", "3", "4", "5" "6", "7", "8", "9", "10", "11", "12"]
CITY      = ["Abidjan", "Tiassalé", "N'Douci", "Agboville", "Divo", "Autres villes"]

#SLUG

end
