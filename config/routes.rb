Rails.application.routes.draw do
	resources :usuarios
	root "debugger#index"
	get '/login', to: 'usuarios#login', as: 'login'

	get 'debugger/index'

	get '/canales', to: 'canales#index', as: 'canales'


end
