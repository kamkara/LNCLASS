class MaterialsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_material


  # GET /materials
  # GET /materials.json
  def index
    @materials = Material.all
  end

  # GET /materials/1
  # GET /materials/1.json
  def show

    #student content
    if current_user.role == "student"
      @materials = Material.all
      @courses   = Course.where("level_id = ? and material_id = ?",
                          current_user.level_id, @material.id)
    #prof content
    elsif current_user.role == "teacher"
       # order pour facilite la recherche du cours
      @materials = Material.where("material_id = ?",
                            current_user.material_id).
                            order('create_at DESC')
      @courses   = Course.where("material_id = ?",
                           @material.id).order('created_at DESC')
      #admin or dev Team
    elsif current_user.role != "teacher" || current_user.role != "teacher"
      @materials = Material.all.order('created_at DESC')
      @courses   =Course.all.order('created_at DESC')
    end
  end

  # GET /materials/new
  def new
    @material = Material.new
  end

  # GET /materials/1/edit
  def edit
  end

  # POST /materials
  # POST /materials.json
  def create
    @material = current_user.materials.build(material_params)

    respond_to do |format|
      if @material.save
        format.html { redirect_to @material, notice: 'Material was successfully created.' }

      else
        format.html { render :new }

      end
    end
  end

  # PATCH/PUT /materials/1
  # PATCH/PUT /materials/1.json
  def update
    respond_to do |format|
      if @material.update(material_params)
        format.html { redirect_to @material, notice: 'Material was successfully updated.' }
        format.json { render :show, status: :ok, location: @material }
      else
        format.html { render :edit }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    @material.destroy
    respond_to do |format|
      format.html { redirect_to materials_url, notice: 'Material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.friendly.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def material_params
      params.require(:material).permit(:title, :cycle)
    end
end
