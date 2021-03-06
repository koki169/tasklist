Rails.application.routes.draw do

	root to: 'sessions#new'

	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'

	get 'signup', to: 'users#new'
	resources :users, only: [:show, :create, :edit, :update, :destroy]

	resources :tasks
end
