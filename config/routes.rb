Rails.application.routes.draw do
  devise_for :users
  root to: 'inks#index'
  resources :inks
end
