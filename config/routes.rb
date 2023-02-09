Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  post '/auth/login', to: 'authentication#create'
  post '/auth/signup', to: 'users#create'

  # :except => [:create]
end
