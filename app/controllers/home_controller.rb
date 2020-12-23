class HomeController < ApplicationController
before_action :find_levels
before_action :find_materials
  def index
    #content for student
    if current_user.role == "student"
      @courses = Course.where("level_id =?", current_user.level_id)
      @materials = Material.all.order('created_at desc')
    else #current_user is prof or admin...
      @courses = Course.all.order('created_at desc')
      @materials = Material.all.order('created_at desc')
      
    end
  end


private
#find levels and material enable to Home controller
   def find_levels
      @levels = Level.all
   end
   def find_materials
    #select all Material 
    @materials = Material.all
   end

end
