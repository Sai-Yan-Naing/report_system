Rails.application.routes.draw do
  get 'reports/index'
  get 'report/index'
  get 'sessions/new'
  get 'users/index'
  get 'home/index'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'reports#index'
  resources :users
  resources :sessions
  resources :articles
  resources :reports
end
