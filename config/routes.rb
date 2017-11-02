Rails.application.routes.draw do
  get 'admin/index'

  root 'store#index', as: 'store_index'

  resources :foods
  resources :buyers
  resources :carts
  resources :line_items
  resources :categories
  resources :orders
  resources :users

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
