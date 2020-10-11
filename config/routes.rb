Rails.application.routes.draw do
  get 'country/index'
  get 'country/show'
  root to: "display#index"
  resources :display, only: [:index, :show]
  resources :country, only: [:index, :show]
  resources :embassy, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
