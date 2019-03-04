Rails.application.routes.draw do
  get 'games/new'
  get 'games/create'
  get 'games/index'
  get 'games/edit'
  get 'games/update'
  get 'games/destroy'

  resources :games, except: [:show]
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
