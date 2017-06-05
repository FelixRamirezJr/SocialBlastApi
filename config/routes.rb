Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/test", to: "application#test", as: 'patient'
  get '/users/:id', to: "users#show"
  post '/users/new', to: "users#new"
  post '/users/set_facebook_token', to: "users#set_facebook_token"
  post '/users/set_facebook_basic_info', to: "users#set_facebook_basic_info"
  post '/blasts/update_blasts', to: "blasts#update_blasts"
  get '/get_blast_list', to: "blasts#get_blast_list"
  post '/blasts/toggle_active', to: "blasts#toggle_active"
  get '/users/set_twitter_basic', to: "users#set_twitter_basic"
end
