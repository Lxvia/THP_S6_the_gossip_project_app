Rails.application.routes.draw do
  root to: 'all_pages#home'
  get '/home/:first_name', to: 'all_pages#home'
  get '/contact', to: 'all_pages#contact'
  get '/team', to: 'all_pages#team'
  get '/gossip', to: 'all_pages#gossip'
  get '/gossip/:id', to:'all_pages#gossip'
  get '/author/:first_name', to:'all_pages#author'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
