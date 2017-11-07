class CanalsController < ApplicationController
  before_action :set_canal, only: [:show, :edit, :update, :destroy]

  # GET /canals
  # GET /canals.json
  def index
    @canals = Canal.all
  end

  # GET /canals/1
  # GET /canals/1.json
  def show
  end

  # GET /canals/new
  def new
    @canal = Canal.new
  end

  # GET /canals/1/edit
  def edit
  end

  # POST /canals
  # POST /canals.json
  def create
    @canal = Canal.new(canal_params)

    respond_to do |format|
      if @canal.save
        format.html { redirect_to @canal, notice: 'Canal was successfully created.' }
        format.json { render :show, status: :created, location: @canal }
      else
        format.html { render :new }
        format.json { render json: @canal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /canals/1
  # PATCH/PUT /canals/1.json
  def update
    respond_to do |format|
      if @canal.update(canal_params)
        format.html { redirect_to @canal, notice: 'Canal was successfully updated.' }
        format.json { render :show, status: :ok, location: @canal }
      else
        format.html { render :edit }
        format.json { render json: @canal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /canals/1
  # DELETE /canals/1.json
  def destroy
    @canal.destroy
    respond_to do |format|
      format.html { redirect_to canals_url, notice: 'Canal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_canal
      @canal = Canal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def canal_params
      params.fetch(:canal, {})
    end
end
