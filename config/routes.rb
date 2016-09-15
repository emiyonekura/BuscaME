Rails.application.routes.draw do


	get 'businesses/index'
	get 'pages/set_address'

  resources :products
  resources :businesses
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  		devise_for :users, controllers: {
	        sessions: 'users/sessions',
	        registrations: 'users/registrations'
      }

  root 'businesses#index'
end
