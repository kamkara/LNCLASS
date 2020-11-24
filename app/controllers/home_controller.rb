class HomeController < ApplicationController

  def index
    #student content
    @materials = Material.all
    @courses = Course.all

  end
end
