Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations", 
            :sessions => "users/sessions", :omniauth_callbacks => "callbacks" }
  
  #devise_scope :user do
  #  get 'sign_in', to: 'users/sessions#new'
  #  get 'sign_out', to: 'users/sessions#destroy'
  #end

  # Defines the root path route ("/")
  root to: 'routines#index'

  get '/me', action: :show, controller: 'users'

  resources :routines do
    resources :tasks do
      get :up, on: :member
      get :down, on: :member
    end
  end

  resources :calendar
  #resources :signin
  #resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

end
