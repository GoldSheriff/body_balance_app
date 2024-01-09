Rails.application.routes.draw do
  get 'admin', to: 'admin#index', as: :admin_page
  get 'users_workouts/buy/:id', to: 'users_workouts#buy', as: :users_workouts_buy
  get 'users_workouts/cancel/:id', to: 'users_workouts#cancel', as: :users_workouts_cancel
  resources :workouts
  root 'home#index'
  get 'dashboard', to: 'home#dashboard', as: 'dashboard'

  get 'home/profile', to: 'home#profile', as: :profile
  get 'home/index'
  get 'home/dashboard'
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
