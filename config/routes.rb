Rails.application.routes.draw do
	
  get 'lists/new'
  get 'lists/create'
  get 'lists/show'
  get 'lists/index'
	root 'home#index'
	
	devise_for :users, controllers: {
	  sessions: 'users/sessions'
	}
	
end