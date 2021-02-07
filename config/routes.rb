Rails.application.routes.draw do
  
  namespace :admin do
    root 'top#index'
    resources :staffs, only:[:new, :create, :destroy]
  end
  resources :spaces do
    resources :comments
    resources :likes
    resources :payments
  end

  resources :feedbacks
  resource :profile
  
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :omniauth_callbacks => 'users/omniauth_callbacks' 
  } 
  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    delete "logout", :to => "users/sessions#destroy"
  end
  
  root 'home#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
