Rails.application.routes.draw do
  resources :users, only: :create
  resources :videos, only: [:index, :create]

  post '/sessions/signin', to: 'sessions#create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
end
