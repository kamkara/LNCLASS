class HomeController < ApplicationController
before_action :find_levels
  def index

    @courses = Course.all.order('created_at desc')
    @materials = Material.all.order('created_at desc')
  end


private
   def find_levels
      @levels = Level.all
   end

end
