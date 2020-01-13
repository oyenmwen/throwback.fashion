Rails.application.routes.draw do
  resources :users
  resources :orders
  resources :sizes
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root'pages#home'
# get 'products', to: 'pages#products'
get 'contact', to: 'pages#contact'
get 'cart', to: 'pages#cart'
# get 'products/:id/buy', to: 'products#buy'
post 'checkout/payment', to: 'pages#purchase'
get 'cart', to: 'pages#cart'
get 'checkout/shipping', to: 'pages#shipping'

end
