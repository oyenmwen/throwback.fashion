Rails.application.routes.draw do
  resources :orders
  resources :users
  resources :sizes
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root'pages#home'
get 'contact', to: 'pages#contact'
get 'cart', to: 'pages#cart'
get 'order/success', to: 'pages#order_success'
get 'checkout/purchase', to: 'pages#purchase'
post 'save', to: 'pages#save'
get 'cart', to: 'pages#cart'
get 'checkout', to: 'pages#checkout'
get 'checkout/success', to: 'pages#buy'
get 'admin/signup', to: 'admins#new'
post 'admins', to: 'admins#create'
get 'admin/login', to: 'sessions#new'
 post 'login', to: 'sessions#create'
 get 'admin/logout', to: 'sessions#destroy'


end
