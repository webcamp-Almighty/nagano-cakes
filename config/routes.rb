Rails.application.routes.draw do

  resource :end_users, only: [:show, :edit, :update]
  get '/end_users/confirm'
  put '/end_users/:id/hide' => 'end_users#hide', as: 'end_users_hide'
  get '/end_users/password' => 'end_users#edit_password'   #パスワード変更用
  put 'edit_users/password' => 'end_users#update_password'

  devise_for :end_users

  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end

  namespace :admins do
    get 'top' => 'homes#top'
    get 'search/search'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :genres, only: [:create, :index, :edit, :update]
    resources :order_items, only: [:update]
  end

  root 'homes#top'

  resources :items, only: [:index, :show] do
    resource :favorites, only: [:create, :destroy]
  end

  resources :cart_items, only: [:create, :index, :update, :destroy]
  delete '/cart_items_delete' => 'cart_items#empty', as: 'cart_items_delete'

   post '/orders/detail' => 'orders#detail', as: 'orders_detail' #修正
  resources :orders, only: [:index, :new, :create, :show] do
    collection do
      get 'detail'
      get 'finish'
    end
  end

  resources :deliveries, except: [:new, :show]

end
