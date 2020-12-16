class HomeController < ApplicationController
before_action :find_levels
  def index
    if current_user.role=="student"
      @materials = Material.all.order('created_at desc')
      #select all course only user.level DESC
      @courses = Course.where("course.level_id=?", current_user.level_id).order('created_at desc')
      #where("course.level_id=?", current_user.level_id)
    elsif current_user.role == 'teacher'
      #select all course DESC
      @courses = Courseall.all..order('created_at desc')
      #where("course.material_id=?", current_user.material_id).order('created_at desc')
      @materials = Material.all..order('created_at desc')
      #where("course.material_id=?", current_user.material_id).order('created_at desc')
    end
  end


private
   def find_levels
      @levels = Level.all
   end

end
