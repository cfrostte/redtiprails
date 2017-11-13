Rails.application.routes.draw do

	devise_for :usuarios, controllers: { 
		confirmations: 'usuarios/confirmations',
		passwords: 'usuarios/passwords', 
		registrations: 'usuarios/registrations', 
		sessions: 'usuarios/sessions', 
		unlocks: 'usuarios/unlocks', 
	}

	get '/mensajes', to: 'mensajes#index'
	get '/mensajes/:id', to: 'mensajes#show'
	post '/mensajes', to: 'mensajes#create'
	get '/debugger', 		to: 'debugger#index', as: 'debugger'
	get '/login', 			to: 'usuarios#login', as: 'login'
	get '/usuarios/:id', 	to: 'usuarios#show'
	get '/usuarios', 		to: 'usuarios#index'
	get '/usuarios/find/:string', to: 'usuarios#find'
	delete '/usuarios/:id', to: 'usuarios#destroy'
	put '/usuarios/:id', 	to: 'usuarios#update'
	root "debugger#index"

end
