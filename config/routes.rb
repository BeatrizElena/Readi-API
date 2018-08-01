# frozen_string_literal: true

Rails.application.routes.draw do
  # RESTful routes
  resources :sessions
  resources :doctors, only: %i[show index]
  # resources :users, only: %i[index show update delete]

  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'



  # next 4 lines: example taken from games-api (ttt).
  # Are the resources lines above auto-generated or were they part of the template?
  # resources :users, only: %i[index show]
  # resources :games, except: [:new, :edit, :destroy]
  # this is the streaming interface
  # get '/games/:id/watch' => 'games#watch'
end


