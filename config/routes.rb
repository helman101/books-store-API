Rails.application.routes.draw do
  resources :books, only: [:create, :destroy, :index]
  root "books#index"
end
