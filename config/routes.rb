Rails.application.routes.draw do
  root to: 'inks#index'
  resources :inks
end
