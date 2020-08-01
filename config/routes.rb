Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  root 'home#index'

  # ユーザ用
  resources :producers, only: [:show] do
    get :list, on: :collection
  end
  resources :products, only: [:show] do 
    get :list, on: :collection
    get :search, on: :collection
  end
  
  # カート関連 
  resources :carts, only: [:show]
  resources :users, only: [:show]
  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'
  
  

  # 管理者がアクセスするページは全て「/admins/xxx/」にする
  resource :admins, only: [:index] do
    get '/' => 'admins#index'
    get '/customers' => 'users#index'
    resources :producers, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :products, only: [:index, :new, :create, :edit, :update, :destroy] 
  end
  

end
