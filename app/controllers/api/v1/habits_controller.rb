# frozen_string_literal: true

module Api
  module V1
    class HabitsController < ApplicationController
      before_action :authenticate_request!
      # Get /habits
      def index
        habits_json = HabitBlueprint.render_as_json current_user!.habits.all
        render json: habits_json
      end

      # Post /habit
      def create
        @habit = current_user!.habits.create(habit_params)
        if @habit.save
          habits_json = HabitBlueprint.render_as_json Habit.find(@habit.id)
          render json: habits_json, status: :created
        else
          habits_json = @habit.errors
          render json: habits_json, status: :unprocessable_entity
        end
      end

      private

      def habit_params
        params.permit(:name, :habit_rating_id, application_intentions_attributes: %i[behaviour time location])
      end
    end
  end
end
