Rails.application.routes.draw do
	
	# devise_for :usuarios, controllers: { 
	# 	confirmations: 'usuarios/confirmations',
	# 	# No se usara omniauth_callbacks,
	# 	passwords: 'usuarios/passwords', 
	# 	registrations: 'usuarios/registrations', 
	# 	sessions: 'usuarios/sessions', 
	# 	unlocks: 'usuarios/unlocks', 
	# }
	
	get '/canales', to: 'canales#index', as: 'canales'
	get '/login', to: 'usuarios#login', as: 'login'
	get 'debugger/index'

	resources :usuarios
	
	root "debugger#index"

end
