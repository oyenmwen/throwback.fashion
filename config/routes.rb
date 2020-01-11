Rails.application.routes.draw do
  resources :orders
  resources :users
  resources :sizes
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root'pages#home'
# get 'products', to: 'pages#products'
get 'contact', to: 'pages#contact'
get 'cart', to: 'pages#cart'
get 'products/:id/buy', to: 'products#buy'
post 'buy', to: 'pages#buy'
get 'cart', to: 'pages#cart'

end
