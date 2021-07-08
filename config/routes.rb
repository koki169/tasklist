Rails.application.routes.draw do

  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
	root to: 'sessions#new'

	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'

	get 'signup', to: 'users#new'
	resources :users, only: [:index, :show, :create, :update, :destroy]

	resources :tasks
end
