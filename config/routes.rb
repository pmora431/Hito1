Rails.application.routes.draw do
  resources :tweets
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'tweets#index'
end
