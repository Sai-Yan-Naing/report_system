Rails.application.routes.draw do
  # get 'reports/index'
  # get 'report/index'
  #for view reports list
  get 'viewreports/:id' => 'reports#index', as: "viewreports"
  get 'sessions/new'
  get 'users/index'
  get 'home/index'
  get '/signup', to: 'users#new'
  delete '/logout',  to: 'sessions#destroy'
  get '/users/viewreport', to: 'users#reports'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'reports#index'
  resources :users
  resources :sessions
  resources :articles
  resources :reports

  

  #for search report
  get 'search/reports', to: 'reports#search'

end
