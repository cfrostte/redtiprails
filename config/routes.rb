Rails.application.routes.draw do
	
	root "debugger#index"
	
	get 'debugger/index'

	get '/canales', to: 'canales#canales', as: 'canales'

end
