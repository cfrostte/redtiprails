Rails.application.routes.draw do
	
	devise_for :usuarios, controllers: { 
		confirmations: 'usuarios/confirmations',
		passwords: 'usuarios/passwords', 
		registrations: 'usuarios/registrations', 
		sessions: 'usuarios/sessions', 
		unlocks: 'usuarios/unlocks', 
	}
	
	# resources 'usuarios'

	get '/canales', to: 'canales#index', as: 'canales'
	get '/debugger', to: 'debugger#index', as: 'debugger'
	get '/login', to: 'usuarios#login', as: 'login'
	get '/usuarios', to: 'usuarios#index', as: 'usuarios'
	
	root "debugger#index"

end
