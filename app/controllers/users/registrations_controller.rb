class Users::RegistrationsController < Devise::RegistrationsController

  layout "home"
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :find_materials
  before_action :find_levels


 protected
  # If you have extra params to permit, append them to the sanitizer.
  def configure_permitted_parameters
    added_attrs = [:username, :first_name, :last_name,
      :contact_phone, :contact_whatsapp, :matricule,
      :role, :city, :school_code, :school_name, :class_name,
      :level_id, :material_id, :gender, :avatar, :slug]

    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs

  end

  #enable material
    def find_materials
      @materials = Material.all
    end

    #enable level
    def find_levels
      @levels = Level.all
    end

end


