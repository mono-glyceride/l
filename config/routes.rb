Rails.application.routes.draw do
	
  get 'lists/new'
  get 'lists/create'
  get 'lists/show'
  get 'lists/index'
	root 'home#index'
	
end