class RacunsController < ApplicationController
  before_action :set_racun, only: [:show, :edit, :update, :destroy]

  # GET /racuns
  # GET /racuns.json
  def index
    @racuns = Racun.all
  end

  # GET /racuns/1
  # GET /racuns/1.json
  def show
  end

  # GET /racuns/new
  def new
    @racun = Racun.new
  end

  # GET /racuns/1/edit
  def edit
  end

  # POST /racuns
  # POST /racuns.json
  def create
    @racun = Racun.new(racun_params)

    respond_to do |format|
      if @racun.save
        format.html { redirect_to @racun, notice: 'Racun was successfully created.' }
        format.json { render action: 'show', status: :created, location: @racun }
      else
        format.html { render action: 'new' }
        format.json { render json: @racun.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /racuns/1
  # PATCH/PUT /racuns/1.json
  def update
    respond_to do |format|
      if @racun.update(racun_params)
        format.html { redirect_to @racun, notice: 'Racun was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @racun.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /racuns/1
  # DELETE /racuns/1.json
  def destroy
    @racun.destroy
    respond_to do |format|
      format.html { redirect_to racuns_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_racun
      @racun = Racun.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def racun_params
      params.require(:racun).permit(:datum, :znesek, :uporabnik_id, :stranka_id)
    end
end
