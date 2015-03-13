Rails.application.routes.draw do
  root to: "users#show"
  resource  :user
  resources :sessions
  resources :bands do
    member do
      resources :albums, only: [:new]
    end
  end
  resources :albums, except: [:index, :new] do
    member do
      resources :tracks, only: [:new]
    end
  end
  resources :tracks, except: [:index, :new]
end
