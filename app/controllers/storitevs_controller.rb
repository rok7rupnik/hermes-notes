class StoritevsController < ApplicationController
  before_action :set_storitev, only: [:show, :edit, :update, :destroy]

  # GET /storitevs
  # GET /storitevs.json
  def index
    @storitevs = Storitev.all
  end

  # GET /storitevs/1
  # GET /storitevs/1.json
  def show
  end

  # GET /storitevs/new
  def new
    @storitev = Storitev.new
  end

  # GET /storitevs/1/edit
  def edit
  end

  # POST /storitevs
  # POST /storitevs.json
  def create
    @storitev = Storitev.new(storitev_params)

    respond_to do |format|
      if @storitev.save
        format.html { redirect_to @storitev, notice: 'Storitev was successfully created.' }
        format.json { render action: 'show', status: :created, location: @storitev }
      else
        format.html { render action: 'new' }
        format.json { render json: @storitev.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /storitevs/1
  # PATCH/PUT /storitevs/1.json
  def update
    respond_to do |format|
      if @storitev.update(storitev_params)
        format.html { redirect_to @storitev, notice: 'Storitev was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @storitev.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storitevs/1
  # DELETE /storitevs/1.json
  def destroy
    @storitev.destroy
    respond_to do |format|
      format.html { redirect_to storitevs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_storitev
      @storitev = Storitev.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def storitev_params
      params.require(:storitev).permit(:skupnaKolicina, :cenaNaKos, :opis, :uporabnik_id)
    end
end
