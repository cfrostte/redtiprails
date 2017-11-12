class MensajesController < ApplicationController

  def index # GET
    mensajes = Mensaje.all
    render json: mensajes
  end

  def show # GET
    mensaje = Mensaje.find_by(id: params['id'])
    render json: mensaje
  end

  def create # POST
    usuario = Usuario.find_by(nickname: params['nickname'])
    mensaje = usuario.mensajes.new(contenido: params['contenido']);
    mensaje.save
    render json: mensaje
  end

end
