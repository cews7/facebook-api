Rails.application.routes.draw do
  root :to => 'home#index'
  get '/user_friends',           to: 'friends#show',  as: :friends
  get '/user_likes',             to: 'likes#index',   as: :likes
  get '/user_birthday',          to: 'birthday#show', as: :birthday
  get '/auth/facebook/callback', to: 'sessions#create'
  delete '/logout',              to: 'sessions#destroy'
  get '/auth/facebook',          as: :login
end
