Rails.application.routes.draw do
	
	devise_for :usuarios, controllers: { 
		confirmations: 'usuarios/confirmations',
		passwords: 'usuarios/passwords', 
		registrations: 'usuarios/registrations', 
		sessions: 'usuarios/sessions', 
		unlocks: 'usuarios/unlocks', 
	}
	
	get '/canales', to: 'canales#index', as: 'canales'
	get '/debugger', to: 'debugger#index', as: 'debugger'
	get '/login', to: 'usuarios#login', as: 'login'
	get '/usuarios/:id', to: 'usuarios#show'
	get '/usuarios', to: 'usuarios#index'
	root "debugger#index"

end
