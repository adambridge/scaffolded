Rails.application.routes.draw do
  get "available" => "calls#available"
  get "scheduled" => "calls#scheduled"
  get "past" => "calls#past"
  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"
  resources :calls
  resources :coaches
  resources :students
  resources :users
  resources :sessions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "calls#scheduled"
end
