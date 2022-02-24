module Api
   module V1
     class HabitRatingController < ApplicationController

      #Get /habit_ratings
      def index
        @ratings = HabitRating.all
      end
     end
   end
end