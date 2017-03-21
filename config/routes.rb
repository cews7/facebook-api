Rails.application.routes.draw do
  root :to => 'home#index'                    
  get '/auth/facebook/callback', to: 'sessions#create'
  delete '/logout',              to: 'sessions#destroy'
  get '/auth/facebook',          as: :login
end
