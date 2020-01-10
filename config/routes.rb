Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root'pages#home'
get 'products', to: 'pages#products'
get 'contact', to: 'pages#contact'
get 'cart', to: 'pages#cart'

end