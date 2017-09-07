Rails.application.routes.draw do
	
	# devise_for :users, controllers: { sessions: 'sessions' }
	# devise_for :usuarios#, controllers: { sessions: 'sessions' }
	devise_for :usuarios, controllers: { sessions: 'usuarios/sessions' }
	
	get '/canales', to: 'canales#index', as: 'canales'
	get '/login', to: 'usuarios#login', as: 'login'
	get 'debugger/index'
	
	resources :usuarios
	
	root "debugger#index"

end
