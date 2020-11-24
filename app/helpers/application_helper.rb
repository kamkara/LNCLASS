module ApplicationHelper
  #custom onglet Msg
  def title
    base_title = "LNCLASS"
    if @title.nil?
      base_title
    else
      " #{@title} - #{base_title}"
    end

  end

  #User sign in ou Sign up Form anywhere

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  #STATUS OF VISITOR "pas encore fonctionnel"
  def visitor(current_user)
    if user_signed_in? && current_user.role == "student"
      visitor_role == "student"#eleves
    elsif user_signed_in? && current_user.role == "teacher"
      visitor_role == "teacher"#professeur
    elsif user_signed_in? && current_user.role == "admin"
      visitor_role == "admin"# admin
    elsif user_signed_in? && current_user.role == "marketing"
      visitor_role == "marketing"#marketing
    end
  end
end
