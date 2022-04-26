module Api
  module V1
    class HabitTrackerEntriesController < ApplicationController
        before_action :authenticate_request!, :get_habit_tracker_entry, only: %i[update]

        def index
            if request.query_parameters.any?
              habit_tracker_entries = []
                request.query_parameters.each do |scope, value|
                    Habit.where(user_id: current_user!.id).each do |habit|
                      habit.habit_tracker_entries.where(completion_status: value).each do |habit_tracker_entry|
                        habit_tracker_entries.push(habit_tracker_entry)
                      end
                    end
                end
            end

            habit_tracker_entries_json = HabitTrackerEntryBlueprint.render_as_json habit_tracker_entries
            render json: habit_tracker_entries_json
        end

        def update
          @habit_tracker_entry.update(
            completion_status:habit_tracker_entry_params[:completion_status],
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

