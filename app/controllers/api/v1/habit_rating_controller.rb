module Api
  module V1
    class HabitRatingController < ApplicationController
      # Get /habit_ratings
      def index
        habit_ratings_json = HabitRatingBlueprint.render_as_json HabitRating.all
        render json: habit_ratings_json
      end
    end
  end
end
