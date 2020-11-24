class HomeController < ApplicationController
#before_action :authenticate_user!
    def index
      if user_signed_in?
        if current_user.role == "student"
          @materials = Material.all
          @courses   = Course.where("level_id = ? ", current_user.level_id)
                              .order('created_at DESC')

        elsif current_user.role == "teacher"
          @levels  = Level.all
          # order pour facilite la recherche du cours
          @materials = Material.where("id = ?",
                                current_user.material_id).order('created_at DESC')
          @courses   = Course.where("material_id = ?",
                              current_user.material_id).order('created_at DESC')

        elsif current_user.role != "teacher" || current_user.role != "teacher"
          @materials = Material.all.order('created_at DESC')
          @courses   =Course.all.order('created_at DESC')
        end
      end
  end
end
#conflit avec sign out
