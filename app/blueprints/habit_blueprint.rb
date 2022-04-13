# frozen_string_literal: true

class HabitBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :user_id, :days_of_week_active
  association :habit_rating, blueprint: HabitRatingBlueprint
  association :application_intentions, blueprint: ApplicationIntentionBlueprint
end
