# frozen_string_literal: true

class HabitBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :user_id
  association :habit_rating, blueprint: HabitRatingBlueprint
  association :application_intentions, blueprint: ApplicationIntentionBlueprint
end
