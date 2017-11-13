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
    
    if usuario 
      # mensaje = usuario.mensajes.new(contenido: params['contenido']);
      mensaje = Mensaje.create(destinatario_id: usuario.id, contenido: params['contenido'], remitente_id: 1)
      mensaje.save
      mensaje.errors.full_messages
      render json: mensaje
    else
      render json: usuario
    end
  
  end

end
