# frozen_string_literal: true

Rails.application.routes.draw do
  get 'habit_tracker_entry/index'
  namespace :api do
    namespace :v1 do
      resources :habit_ratings, only: %i[index create destroy]
      resources :habits, only: %i[index create update destroy]
      resources :application_intentions, only: %i[index create update destroy]
      resources :habit_tracker_entries, only: %i[index]
      post 'register', to: 'users#create'
      post 'login', to: 'authentication#create'
    end
  end
end
