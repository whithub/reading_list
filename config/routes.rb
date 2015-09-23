Rails.application.routes.draw do

  root 'links#index'

  get '/welcome', to: 'home#index'

  get '/login',  to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', as: :logout, to: 'sessions#destroy'


  resources :users do
    resources :links do
      member do
        get :unread
        get :read
      end
      get '/recommend', to: 'recommendations#send_email'
      post '/recommend', to: 'recommendations#send_email'
    end
  end

end
