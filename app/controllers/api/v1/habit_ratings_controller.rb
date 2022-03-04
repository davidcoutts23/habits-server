# frozen_string_literal: true

module Api
  module V1
    class HabitRatingsController < ApplicationController
      # Get /habit_ratings
      def index
        habit_ratings_json = HabitRatingBlueprint.render_as_json HabitRating.all
        render json: habit_ratings_json
      end
    end
  end
end
