Rails.application.routes.draw do
  resources :users, only: :create
  resources :videos, only: [:index, :create]
  post '/sessions/signin', to: 'sessions#create'

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
end
