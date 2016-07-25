Rails.application.routes.draw do
  resources :users
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
