class UporabniksController < ApplicationController
  before_action :set_uporabnik, only: [:show, :edit, :update, :destroy]

  # GET /uporabniks
  # GET /uporabniks.json
  def index
    @uporabniks = Uporabnik.all
  end

  # GET /uporabniks/1
  # GET /uporabniks/1.json
  def show
  end

  # GET /uporabniks/new
  def new
    @uporabnik = Uporabnik.new
  end

  # GET /uporabniks/1/edit
  def edit
  end

  # POST /uporabniks
  # POST /uporabniks.json
  def create
    @uporabnik = Uporabnik.new(uporabnik_params)

    respond_to do |format|
      if @uporabnik.save
        format.html { redirect_to @uporabnik, notice: 'Uporabnik was successfully created.' }
        format.json { render action: 'show', status: :created, location: @uporabnik }
      else
        format.html { render action: 'new' }
        format.json { render json: @uporabnik.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uporabniks/1
  # PATCH/PUT /uporabniks/1.json
  def update
    respond_to do |format|
      if @uporabnik.update(uporabnik_params)
        format.html { redirect_to @uporabnik, notice: 'Uporabnik was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @uporabnik.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uporabniks/1
  # DELETE /uporabniks/1.json
  def destroy
    @uporabnik.destroy
    respond_to do |format|
      format.html { redirect_to uporabniks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uporabnik
      @uporabnik = Uporabnik.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uporabnik_params
      params.require(:uporabnik).permit(:ime, :priimek, :nazivPodjetja, :naslov, :email, :telefon, :davcna, :trr, :ddv, :geslo, :posta_id)
    end
end
