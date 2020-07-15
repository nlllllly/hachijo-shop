Rails.application.routes.draw do
  get 'carts/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :products, only: [:index]

  resources :carts, only: [:show]

  
  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'
  

end
