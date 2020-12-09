class PWelcomeController < ApplicationController
  before_action :find_materials

  def sign_up
  end


  private
   def find_materials
      @materials = Material.all
   end


end
