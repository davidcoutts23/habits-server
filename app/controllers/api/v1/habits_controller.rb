module Api
   module V1
     class HabitsController < ApplicationController

      #Get /habits
      def index
        habits_json = HabitBlueprint.render_as_json Habit.all
        render json: habits_json
      end
     end
   end
end