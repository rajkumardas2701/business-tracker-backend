Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  mount ActionCable.server => './cable'
  resources :users do
    member do
      get 'chat_rooms'
    end
  end
  resources :deals
  resources :financial_transactions
  resources :messages
  resources :chat_rooms
  post '/auth/login', to: 'authentication#create'
  post '/auth/signup', to: 'users#create'
end
