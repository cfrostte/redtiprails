class DebuggerController < ApplicationController

	require 'httparty'

	def index
		url = "http://rubygems.org/api/v1/versions/httparty.json"
		response = HTTParty.get(url, :verify => false)
		render plain: response.to_json
	end

	def canales
		render plain: '[{"nombre":"canal1"},{"nombre":"canal2"},{"nombre":"canal3"}]'
	end

end
