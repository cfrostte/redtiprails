Rails.application.routes.draw do
	resources :usuarios
	root "debugger#index"
	get '/login', to: 'usuarios#login', as: 'login'
	
	get 'debugger/index'

	get '/canales/{nikcname}/{password}', to: 'canales#index', as: 'canales'
	#get '/usuarios', to: 'usuarios#index', as: 'usuarios'


end
