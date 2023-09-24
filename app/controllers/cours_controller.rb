class CoursController < ApplicationController
  before_action :set_cour, only: %i[ show edit update destroy ]

  # GET /cours or /cours.json
  def index
    @cours = Cour.all
  end

  # GET /cours/1 or /cours/1.json
  def show
    @line_items =  LineItem.new
  end

  # GET /cours/new
  def new
    @cour = Cour.new
  end

  # GET /cours/1/edit
  def edit
  end

  # POST /cours or /cours.json
  def create
    @cour = Cour.new(cour_params)

    respond_to do |format|
      if @cour.save
        format.html { redirect_to cour_url(@cour), notice: "Cour was successfully created." }
        format.json { render :show, status: :created, location: @cour }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cours/1 or /cours/1.json
  def update
    respond_to do |format|
      if @cour.update(cour_params)
        format.html { redirect_to cour_url(@cour), notice: "Cour was successfully updated." }
        format.json { render :show, status: :ok, location: @cour }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cours/1 or /cours/1.json
  def destroy
    @cour.destroy

    respond_to do |format|
      format.html { redirect_to cours_url, notice: "Cour was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cour
      @cour = Cour.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cour_params
      params.require(:cour).permit(:title, :content, :thumbnail, :video, :description)
    end
end
