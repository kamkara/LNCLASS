class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :find_materials
  before_action :find_levels


  def index
    @materials = Material.all
    @levels = Level.all
  end


private

    #enable material
    def find_materials
      @materials = Material.all
    end

    #enable level
    def find_levels
      @levels = Level.all
    end
end
