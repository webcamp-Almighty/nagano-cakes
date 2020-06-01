Rails.application.routes.draw do
  #get 'genres/index'
  resources :genres, only: [:index, :create, :edit, :update]
  devise_for :end_users
  get 'orders/index'
  get 'orders/new'
  get 'orders/show'
  get 'orders/detail'
  get 'orders/finish'
  get 'cart_items/index'
  get 'deliveries/index'
  get 'deliveries/edit'
  get 'end_users/show'
  get 'end_users/edit'
  get 'homes/top'
  root 'homes#top'

  resources :items, only: [:index, :show]
  resources :cart_items, only: [:create, :index, :update, :destroy]
  delete '/cart_items' => 'cart_items#empty'

  resources :orders, only: [:new, :create]
  get '/orders/detail' => 'orders#detail'
  get '/orders/finish' => 'orders#finish'

  resource :end_users, only: [:show, :edit, :update]
  get '/end_users' => 'end_users#confirm'
  patch '/end_users' => 'end_users#hide'

  resources :deliveries, only: [:index, :create, :edit, :update, :destroy]

  resource :orders, only: [:index, :show]

#   #管理者
# 　namespace :admin do
# 	#deviseのルーティングは一旦保留
# 	 #get "/admin/login" => "admin/user_sessions#new"
# 	#topページ

# 	resources :items, only: [:index, :new, :create, :show, :edit, :update]
# 	resources :genres, only: [:create, :index, :edit, :update]
# 	resources :end_users, only: [:index, :show, :edit, :update]
# 	resources :orders, only: [:index, :show, :update]
# 	resources :orders_item, only: [:update]
#   end




end
