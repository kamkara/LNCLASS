class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :trackable, authentication_keys: [:login]

  ##################  RELATIONS  ###################

  has_many :courses, dependent: :destroy
  has_many :materials
  has_many :levels
  has_many :exercices


################  VALIDATIONS  ###########################

    ###### UNIQUENESS  ######
    validates :matricule, :email, uniqueness: true

    ###### PRESENTES && FORMAT  ######
    validates :contact_phone,
              :city, :school_name,
              :email, :city, presence: true

    validates :last_name, :first_name,
              presence: true,
              length: { maximum: 30 },
              format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }

    validates :contact_phone, :contact_whatsapp,
              length: { in: 8..12 }, uniqueness: true


################ NOT IMPLENETED  ###########################
  #validates :gender, presence: true
  #Birthday
   #validates :birthday, presence: true
  #enum
  #enum gender: [:male, :female]


################  CUSTOM ACTIONS  ###########################

def full_username_is_slug
  self.username = "#{self.first_name} #{self.last_name}"
end

################  BEFORE ACTIONS  ###########################
#Delete whitespaces before and after fields, DownCase and capitalize
before_save do
  self.contact_phone      = contact_phone.strip.squeeze(" ")
  self.contact_whatsapp   = contact_whatsapp.strip.squeeze(" ")
  self.first_name         = first_name.strip.squeeze(" ").downcase.capitalize
  self.last_name          = last_name.strip.squeeze(" ").downcase.capitalize
  self.username          = username.strip.squeeze(" ")
  self.city               = city.strip.squeeze(" ").downcase.capitalize
  self.school_name        = school_name.strip.squeeze(" ").downcase.capitalize
    #self.class_name         = class_name.strip.squeeze(" ").downcase.capitalize
  end

################  SLUG   ###########################

  #use other slug if current slug not evalable
  def full_username_is_slug
    [
      :full_username_is_slug,
      [:full_username_is_slug, :school_name],
      [:full_username_is_slug, :school_name, :contact_phone],
      [:full_username_is_slug, :school_name, :contact_phone, :city],

    ]
  end
  extend FriendlyId
    friendly_id :full_username_is_slug , use: :slugged



################  CONSTANTE   ###########################
CLASSROOM = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
CITY      = ["Abidjan", "Tiassalé", "N'Douci", "Agboville", "Divo", "Autres villes"]


################  SIGN IN PHONE NUMBR OR EMAIL  ###########################

  attr_writer :login

  def login
    @login || self.contact_phone || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(contact_phone) = :value OR lower(email) = :value", { :value => login }]).first
      elsif conditions.has_key?(:contact_phone) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
  end

end
