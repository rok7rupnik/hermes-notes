class PostavkasController < ApplicationController
  before_action :set_postavka, only: [:show, :edit, :update, :destroy]

  # GET /postavkas
  # GET /postavkas.json
  def index
    @postavkas = Postavka.all
  end

  # GET /postavkas/1
  # GET /postavkas/1.json
  def show
  end

  # GET /postavkas/new
  def new
    @postavka = Postavka.new
  end

  # GET /postavkas/1/edit
  def edit
  end

  # POST /postavkas
  # POST /postavkas.json
  def create
    @postavka = Postavka.new(postavka_params)

    respond_to do |format|
      if @postavka.save
        format.html { redirect_to @postavka, notice: 'Postavka was successfully created.' }
        format.json { render action: 'show', status: :created, location: @postavka }
      else
        format.html { render action: 'new' }
        format.json { render json: @postavka.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postavkas/1
  # PATCH/PUT /postavkas/1.json
  def update
    respond_to do |format|
      if @postavka.update(postavka_params)
        format.html { redirect_to @postavka, notice: 'Postavka was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @postavka.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postavkas/1
  # DELETE /postavkas/1.json
  def destroy
    @postavka.destroy
    respond_to do |format|
      format.html { redirect_to postavkas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postavka
      @postavka = Postavka.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def postavka_params
      params.require(:postavka).permit(:zaporednaSt, :kolicina, :popust, :racun_id, :storitev_id)
    end
end
