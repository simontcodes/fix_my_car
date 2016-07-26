Rails.application.routes.draw do
  #root :to => 'users#index'
  resources :user_sessions
  resources :users

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout


  root 'dashboards#index'
  get '/dashboards' => 'dashboards#index'
  get '/history' => 'history#index'
  resources :jobs
  resources :mechanics
  resources :statuses
  resources :costs
  resources :clients do
    resources :cars
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
