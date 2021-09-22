Rails.application.routes.draw do
  root to: 'tops#index'
  devise_for :users
  resources :tops
end
