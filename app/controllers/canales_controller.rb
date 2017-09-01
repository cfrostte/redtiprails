class CanalesController < ApplicationController

	def index
		render json: '[{"nombre":"canal1"},{"nombre":"canal2"},{"nombre":"canal3"}]'
	end

end
