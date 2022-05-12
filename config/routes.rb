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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
