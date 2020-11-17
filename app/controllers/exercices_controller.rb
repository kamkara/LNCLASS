class ExercicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exercice, only: [:show, :edit, :update, :destroy]
  before_action :find_course

  # GET /exercices
  # GET /exercices.json
  def index
    @exercices = Exercice.all
  end

  # GET /exercices/1
  # GET /exercices/1.json
  def show
  end

  # GET /exercices/new
  def new
    @exercice = Exercice.new
  end

  # GET /exercices/1/edit
  def edit
  end

  # POST /exercices
  # POST /exercices.json
  def create
    @exercice = current_user.exercices.build(exercice_params)
    @exercice.author = current_user.username
    #@exercice.course = @course.course_id
    respond_to do |format|
      if @exercice.save
        format.html { redirect_to @exercice, notice: 'Exercice was successfully created.' }
        format.json { render :show, status: :created, location: @exercice }
      else
        format.html { render :new }
        format.json { render json: @exercice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercices/1
  # PATCH/PUT /exercices/1.json
  def update
    respond_to do |format|
      if @exercice.update(exercice_params)
        format.html { redirect_to @exercice, notice: 'Exercice was successfully updated.' }
        format.json { render :show, status: :ok, location: @exercice }
      else
        format.html { render :edit }
        format.json { render json: @exercice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercices/1
  # DELETE /exercices/1.json
  def destroy
    @exercice.destroy
    respond_to do |format|
      format.html { redirect_to exercices_url, notice: 'Exercice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercice
      @exercice = Exercice.friendly.find(params[:id])
    end
    #Enable course for exercice
    def find_course
      @courses = Course.all
    end

    # Only allow a list of trusted parameters through.
    def exercice_params
      params.require(:exercice).permit(:title, :content, :author, :search_id, :slug, :course_id, :user_id)
    end
end
