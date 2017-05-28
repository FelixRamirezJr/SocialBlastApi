Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/test", to: "application#test", as: 'patient'
  get '/users/:id', to: "users#show"
  post '/users/new', to: "users#new"
  post '/users/set_facebook_token', to: "users#set_facebook_token"
end
