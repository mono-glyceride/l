Rails.application.routes.draw do
	
  get 'lists/new'
  get 'lists/create'
  get 'lists/show'
	root 'lists#index'
	
	devise_for :users, controllers: {
	  sessions: 'users/sessions',
	  omniauth_callbacks: 'users/omniauth_callbacks'
	}
	
end