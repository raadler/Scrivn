Rails.application.routes.draw do
  root to: 'inks#index'
  resources :inks

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  namespace :admin do
    resources :users
  end
end
