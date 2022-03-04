Rails.application.routes.draw do
 namespace :api do
   namespace :v1 do
     resources :habit_rating, only: %i[index create destroy]
     resources :habits, only: %i[index create destroy]
     resources :application_intentions, only: %i[index create destroy]
   end
 end
end