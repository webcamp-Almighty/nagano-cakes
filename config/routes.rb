Rails.application.routes.draw do

  resource :end_users, only: [:show, :edit, :update]
  get '/end_users/confirm' => 'end_users#confirm'
  patch '/end_users' => 'end_users#hide'

  devise_for :end_users

  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end

  namespace :admins do
    get 'top' => 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :genres, only: [:create, :index, :edit, :update]
    resources :order_items, only: [:update]
  end

  root 'homes#top'

  resources :items, only: [:index, :show] do
    get :search, on: :collection
  end

  resources :cart_items, only: [:create, :index, :update, :destroy]
  delete '/cart_items_delete' => 'cart_items#empty', as: 'cart_items_delete'

  get '/orders/detail' => 'orders#detail', as: 'orders_detail'
  get '/orders/finish' => 'orders#finish'
  resources :orders, only: [:index, :new, :create, :show]


  resources :deliveries, except: [:new, :show]

end
