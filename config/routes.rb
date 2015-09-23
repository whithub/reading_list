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
      resources :recommendations, only: [:new, :create]
    end
  end

end
