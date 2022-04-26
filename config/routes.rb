Rails.application.routes.draw do
	
  get 'lists/new'
  get 'lists/create'
  get 'lists/show'
	root 'lists#index'
	
end