Rails.application.routes.draw do
  root to: 'shares#index'
  devise_for :users
  resources :shares
end
