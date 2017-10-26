Rails.application.routes.draw do
  resources :carts
  resources :store
  resources :buyers
  resources :foods
  get 'home/hello'
  get 'home/goodbye'
  root 'store#index', as: 'store_index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
