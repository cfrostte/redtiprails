class MensajesController < ApplicationController
  before_action :set_mensaje, only: [:show, :edit, :update, :destroy]

  # GET /mensajes
  # GET /mensajes.json
  def index
    @mensajes = Mensaje.all
  end

  # GET /mensajes/1
  # GET /mensajes/1.json
  def show
  end

  # GET /mensajes/new
  def new
    @mensaje = Mensaje.new
  end

  # GET /mensajes/1/edit
  def edit
  end

  # POST /mensajes
  # POST /mensajes.json
  def create
    @mensaje = Mensaje.new(mensaje_params)

    respond_to do |format|
      if @mensaje.save
        format.html { redirect_to @mensaje, notice: 'Mensaje was successfully created.' }
        format.json { render :show, status: :created, location: @mensaje }
      else
        format.html { render :new }
        format.json { render json: @mensaje.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mensajes/1
  # PATCH/PUT /mensajes/1.json
  def update
    respond_to do |format|
      if @mensaje.update(mensaje_params)
        format.html { redirect_to @mensaje, notice: 'Mensaje was successfully updated.' }
        format.json { render :show, status: :ok, location: @mensaje }
      else
        format.html { render :edit }
        format.json { render json: @mensaje.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mensajes/1
  # DELETE /mensajes/1.json
  def destroy
    @mensaje.destroy
    respond_to do |format|
      format.html { redirect_to mensajes_url, notice: 'Mensaje was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mensaje
      @mensaje = Mensaje.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mensaje_params
      params.fetch(:mensaje, {})
    end
end
