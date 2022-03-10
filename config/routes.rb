# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :habit_ratings, only: %i[index create destroy]
      resources :habits, only: %i[index create destroy]
      resources :application_intentions, only: %i[index create destroy]
      post 'register', to: 'users#create'
      post 'login', to: 'authentication#create'
    end
  end
end
