class StroseksController < ApplicationController
  before_action :set_strosek, only: [:show, :edit, :update, :destroy]

  # GET /stroseks
  # GET /stroseks.json
  def index
    @stroseks = Strosek.all
  end

  # GET /stroseks/1
  # GET /stroseks/1.json
  def show
  end

  # GET /stroseks/new
  def new
    @strosek = Strosek.new
  end

  # GET /stroseks/1/edit
  def edit
  end

  # POST /stroseks
  # POST /stroseks.json
  def create
    @strosek = Strosek.new(strosek_params)

    respond_to do |format|
      if @strosek.save
        format.html { redirect_to @strosek, notice: 'Strosek was successfully created.' }
        format.json { render action: 'show', status: :created, location: @strosek }
      else
        format.html { render action: 'new' }
        format.json { render json: @strosek.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stroseks/1
  # PATCH/PUT /stroseks/1.json
  def update
    respond_to do |format|
      if @strosek.update(strosek_params)
        format.html { redirect_to @strosek, notice: 'Strosek was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @strosek.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stroseks/1
  # DELETE /stroseks/1.json
  def destroy
    @strosek.destroy
    respond_to do |format|
      format.html { redirect_to stroseks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_strosek
      @strosek = Strosek.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def strosek_params
      params.require(:strosek).permit(:datum, :znesek, :opis, :uporabnik_id)
    end
end
