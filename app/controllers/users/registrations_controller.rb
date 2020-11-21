class Users::RegistrationsController < Devise::RegistrationsController
  layout "home"
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]


  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys:
      [:username, :contact, :role, :city, :school_name, :matricule, :school_code, :level_id, :slug])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys:
       [:email, :username, :contact, :school_code, :city, :role, :school_name, :level_id, :memo, :slug, :avatar])
  end

end


