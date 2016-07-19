Rails.application.routes.draw do
  root 'dashboards#index'
  get '/dashboards' => 'dashboards#index'
  resources :jobs
  resources :mechanics
  resources :clients do
    resources :cars
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
