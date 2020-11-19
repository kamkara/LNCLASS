class HomeController < ApplicationController
  layout "home"

  def index
    @courses = Course.all.order('created_at desc')
    @materials = Material.all
  end
end
