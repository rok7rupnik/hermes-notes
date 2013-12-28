class StrankasController < ApplicationController
  before_action :set_stranka, only: [:show, :edit, :update, :destroy]

  # GET /strankas
  # GET /strankas.json
  def index
    @strankas = Stranka.all
  end

  # GET /strankas/1
  # GET /strankas/1.json
  def show
  end

  # GET /strankas/new
  def new
    @stranka = Stranka.new
  end

  # GET /strankas/1/edit
  def edit
  end

  # POST /strankas
  # POST /strankas.json
  def create
    @stranka = Stranka.new(stranka_params)

    respond_to do |format|
      if @stranka.save
        format.html { redirect_to @stranka, notice: 'Stranka was successfully created.' }
        format.json { render action: 'show', status: :created, location: @stranka }
      else
        format.html { render action: 'new' }
        format.json { render json: @stranka.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /strankas/1
  # PATCH/PUT /strankas/1.json
  def update
    respond_to do |format|
      if @stranka.update(stranka_params)
        format.html { redirect_to @stranka, notice: 'Stranka was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @stranka.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /strankas/1
  # DELETE /strankas/1.json
  def destroy
    @stranka.destroy
    respond_to do |format|
      format.html { redirect_to strankas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stranka
      @stranka = Stranka.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stranka_params
      params.require(:stranka).permit(:ime, :priimek, :nazivPodjetja, :naslov, :email, :telefon, :davcna, :trr, :ddv, :posta_id)
    end
end
