class PostaController < ApplicationController
  before_action :set_postum, only: [:show, :edit, :update, :destroy]

  # GET /posta
  # GET /posta.json
  def index
    @posta = Posta.all
  end

  # GET /posta/1
  # GET /posta/1.json
  def show
  end

  # GET /posta/new
  def new
    @postum = Posta.new
  end

  # GET /posta/1/edit
  def edit
  end

  # POST /posta
  # POST /posta.json
  def create
    @postum = Posta.new(postum_params)

    respond_to do |format|
      if @postum.save
        format.html { redirect_to @postum, notice: 'Posta was successfully created.' }
        format.json { render action: 'show', status: :created, location: @postum }
      else
        format.html { render action: 'new' }
        format.json { render json: @postum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posta/1
  # PATCH/PUT /posta/1.json
  def update
    respond_to do |format|
      if @postum.update(postum_params)
        format.html { redirect_to @postum, notice: 'Posta was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @postum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posta/1
  # DELETE /posta/1.json
  def destroy
    @postum.destroy
    respond_to do |format|
      format.html { redirect_to posta_index_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postum
      @postum = Posta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def postum_params
      params.require(:postum).permit(:postnaSt, :naziv)
    end
end
