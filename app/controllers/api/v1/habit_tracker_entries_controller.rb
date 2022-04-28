# frozen_string_literal: true

module Api
  module V1
    class HabitTrackerEntriesController < ApplicationController
      before_action :authenticate_request!, :get_habit_tracker_entry, only: %i[update]

      def index
        habit_tracker_entries = []

        habits = if request.query_parameters.member?('habit_id')
                   Habit.where(user_id: current_user!.id, id: request.query_parameters['habit_id'])
                 else
                   Habit.where(user_id: current_user!.id)
                 end

        habits.each do |habit|
          if request.query_parameters.member?('completion_status')
            habit.habit_tracker_entries.where(completion_status: request.query_parameters['completion_status']).each do |habit_tracker_entry|
              habit_tracker_entries.push(habit_tracker_entry)
            end
          else
            habit.habit_tracker_entries.each do |habit_tracker_entry|
              habit_tracker_entries.push(habit_tracker_entry)
            end
          end
        end

        habit_tracker_entries_json = HabitTrackerEntryBlueprint.render_as_json habit_tracker_entries
        render json: habit_tracker_entries_json
      end

      def update
        @habit_tracker_entry.update(
          completion_status: habit_tracker_entry_params[:completion_status]
        )

        habit_tracker_entry_json = HabitTrackerEntryBlueprint.render_as_json @habit_tracker_entry
        render json: habit_tracker_entry_json, status: :ok
      end

      private

      def habit_tracker_entry_params
        params.permit(:id, :completion_status)
      end

      def get_habit_tracker_entry
        @habit_tracker_entry = HabitTrackerEntry.find(params[:id])
      end
    end
  end
end
