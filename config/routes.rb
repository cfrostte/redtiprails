Rails.application.routes.draw do
	
	root "debugger#index"
	
	get 'debugger/index'

	get '/canales', to: 'debugger#canales', as: 'canales'

end
