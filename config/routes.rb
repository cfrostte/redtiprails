Rails.application.routes.draw do

	devise_for :usuarios, controllers: { 
		confirmations: 'usuarios/confirmations',
		passwords: 'usuarios/passwords', 
		registrations: 'usuarios/registrations', 
		sessions: 'usuarios/sessions', 
		unlocks: 'usuarios/unlocks', 
	}

	delete '/usuarios/:id', to: 'usuarios#destroy'

	# get '/canales', to: 'canales#index', as: 'canales'
	get '/debugger', to: 'debugger#index', as: 'debugger'
	get '/login', to: 'usuarios#login', as: 'login'
	get '/mensajes', to: 'mensajes#index'
	get '/mensajes/:id', to: 'mensajes#show'
	get '/usuarios', to: 'usuarios#index'
	get '/usuarios/:id', to: 'usuarios#show'

	post '/mensajes', to: 'mensajes#create'
	
	root "debugger#index"

end
