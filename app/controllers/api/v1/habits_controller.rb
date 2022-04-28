# frozen_string_literal: true

module Api
  module V1
    class HabitsController < ApplicationController
      before_action :authenticate_request!, :get_habit, only: %i[habit_tracker_weekly_progress]
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

      # Put /habit/id
      def update
        get_habit.update(
          name: habit_params[:name],
          habit_rating_id: habit_params[:habit_rating_id],
          days_of_week_active: habit_params[:days_of_week_active]
        )
        habit_json = HabitBlueprint.render_as_json get_habit
        render json: habit_json, status: :ok
      end

      def destroy
        ApplicationIntention.where(habit_id: get_habit.id).destroy_all
        get_habit.destroy
      end

      def habit_tracker_weekly_progress
        @habit.habit_tracker_weekly_progress
      end

      private

      def habit_params
        params.permit(:name, :habit_rating_id, days_of_week_active: [],
                                               application_intentions_attributes: %i[behaviour time location])
      end

      def get_habit
        @habit = Habit.find(params[:id])
      end
    end
  end
end
