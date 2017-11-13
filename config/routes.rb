Rails.application.routes.draw do
	
  get 'mensajes/new'

  get 'mensajes/create'

  get 'mensajes/update'

  get 'mensajes/edit'

  get 'mensajes/destroy'

  get 'mensajes/index'

  get 'mensajes/show'

	devise_for :usuarios, controllers: { 
		confirmations: 'usuarios/confirmations',
		passwords: 'usuarios/passwords', 
		registrations: 'usuarios/registrations', 
		sessions: 'usuarios/sessions', 
		unlocks: 'usuarios/unlocks', 
	}
	
	get '/canales', 		to: 'canales#index', as: 'canales'
	get '/debugger', 		to: 'debugger#index', as: 'debugger'
	get '/login', 			to: 'usuarios#login', as: 'login'

	get '/usuarios/:id', 	to: 'usuarios#show'
	get '/usuarios', 		to: 'usuarios#index'
	get '/usuarios/find/:string', to: 'usuarios#find'
	delete '/usuarios/:id', to: 'usuarios#destroy'
	put '/usuarios/:id', 	to: 'usuarios#update'

	root "debugger#index"

end
