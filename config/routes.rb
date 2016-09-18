Rails.application.routes.draw do

  resources :businesses do
    resources :products, except: [:index] 
  end

	get 'products/index'
	get 'pages/set_address'
  get 'get_address', to: "users#get_address"

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  		devise_for :users, controllers: {
	        sessions: 'users/sessions',
	        registrations: 'users/registrations'
      }


  root 'businesses#index'
end
