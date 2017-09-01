class CanalesController < ApplicationController

	def canales
		render json: '[{"nombre":"canal1"},{"nombre":"canal2"},{"nombre":"canal3"}]'
	end

end
