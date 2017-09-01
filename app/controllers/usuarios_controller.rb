class UsuariosController < ApplicationController

	def index
		
		if params['nickname'] && params['password']
			@usuarios = Usuario.where(nickname: params['nickname']).where(password: params['password'])
		else
			@usuarios = Usuario.all
		end
		
		render json: @usuarios
	
	end

end
