Rails.application.routes.draw do
  devise_for :users, module: "users", only: [:sessions, :registrations]
          #:controllers => { :registrations => "users/registrations", 
           # :sessions => "users/sessions", :calendars => ""}#:omniauth_callbacks => "callbacks" }

  #devise_scope :user do
  #end

  # Defines the root path route ("/")
  #root to: 'routines#discover'
  get '/home' => 'home#index'
  root to: redirect('/home')

  get '/discover' => 'routines#discover'

  get '/edit_routine_copy' => 'routines#edit_routine_copy'

  post '/copy_routine' => 'routines#copy_routine'

  get '/discover_show' => 'routines#discover_show'
  
  as :user do
    get '/me', :to => 'users#show', :as => :user
  end

  authenticated :user do
    root to: 'routines#index', as: :authenticated_root
    resources :users do
      post 'update_settings'
    end
  end
  
  resources :routines do
    resources :tasks do
      get :up, on: :member
      get :down, on: :member
    end
    get :complete, on: :member
  end

  resource :calendar do
    get :day, on: :member    
  end

  resource :completions

  get '/daily' => 'calendars#daily'
  get '/weekly' => 'calendars#weekly'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

end
