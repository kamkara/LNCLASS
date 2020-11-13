class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @courses = Course.all.order('created_at desc')
    @materials = Material.all
  end
end
