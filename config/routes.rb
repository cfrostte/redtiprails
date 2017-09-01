Rails.application.routes.draw do
	resources :usuarios
	root "debugger#index"
	
	get 'debugger/index'

	get '/canales', to: 'canales#index', as: 'canales'
	#get '/usuarios', to: 'usuarios#index', as: 'usuarios'

end
