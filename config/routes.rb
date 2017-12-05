Rails.application.routes.draw do

	devise_for :usuarios, controllers: { 
		confirmations: 'usuarios/confirmations',
		passwords: 'usuarios/passwords', 
		registrations: 'usuarios/registrations', 
		sessions: 'usuarios/sessions', 
		unlocks: 'usuarios/unlocks', 
	}

	get '/mensajes', 		to: 'mensajes#index'
	get '/mensajes/:id', 	to: 'mensajes#show'
	post '/mensajes/:id', 	to: 'mensajes#create'
	get '/chat/:id', 		to: 'mensajes#chat'
	
	# get '/chat', 			to: 'mensajes#chat'
	get '/debugger', 		to: 'debugger#index', as: 'debugger'
	get '/usuarios/find', to: 'usuarios#find'
	# get '/findusuario', 	to: 'usuarios#find'
	
	get '/usuarios', 		to: 'usuarios#index'
	get '/usuarios/:id', 	to: 'usuarios#show'
	# get '/usuarios/find', 	to: 'usuarios#find'
	put '/usuarios/:id', 	to: 'usuarios#update'
	delete '/usuarios/destroy', to: 'usuarios#destroy'

	get '/login', 			to: 'usuarios#login', as: 'login'
	
	# delete '/usuarios', to: 'usuarios#destroy'
	root "debugger#index"

	get '/contactos/:id',	to: 'usuarios#contactos'

end
