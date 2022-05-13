Rails.application.routes.draw do
  resources :comments
  root to: 'all_pages#home'
  get '/home/:first_name', to: 'all_pages#home'
  get '/contact', to: 'all_pages#contact'
  get '/team', to: 'all_pages#team'
  get '/author/:first_name', to:'all_pages#author'
  resources :gossip do
    resources :comments
  end
  resources :cities
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'log_in', to: 'sessions#new'
  post 'log_in', to: 'sessions#create'
  get 'log_out', to: 'sessions#destroy'

  resources :likes, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
