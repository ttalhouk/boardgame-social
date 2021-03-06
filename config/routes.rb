Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'home/index'
  root 'home#index'

  post 'friendships/create'
  delete 'friendships/destroy'

  post 'loans/create'
  put 'loans/confirm'
  delete 'loans/destroy'

  get 'games/search', to: 'games#search', as: 'games_search'
  get 'games/result', to: 'games#result', as: 'games_result'

  get 'users/search', to: 'users#search', as: 'users_search'
  get 'users/result', to: 'users#result', as: 'users_result'

  resources :users, only: [:show] do
    resources :games, only: [:index, :show]
    post 'games/sync', to: 'games#sync', as: 'games_sync'
    post 'games/add', to: 'games#add', as: 'games_add'
    delete 'games/remove', to: 'games#remove', as:'games_remove'
  end
end
