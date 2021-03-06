Rails.application.routes.draw do
  get 'admin/index'

  root 'store#index', as: 'store_index'

  resources :foods
  resources :carts
  resources :line_items
  resources :categories
  resources :orders
  resources :users
  resources :vouchers
  resources :tags
  resources :reviews

  resources :foods do
    resources :reviews
  end
  resources :restaurants do
    resources :reviews
  end

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :foods
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
