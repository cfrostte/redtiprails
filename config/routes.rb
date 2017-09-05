Rails.application.routes.draw do
	resources :usuarios
	# devise_for :usuarios#, controllers: { sessions: 'sessions' }
	devise_for :usuarios, controllers: { sessions: 'usuarios/sessions' }
	# devise_for :users, controllers: { sessions: 'sessions' }

	root "debugger#index"
	get '/login', to: 'usuarios#login', as: 'login'

	get 'debugger/index'

	get '/canales', to: 'canales#index', as: 'canales'


end
