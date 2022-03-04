class HabitBlueprint < Blueprinter::Base
  identifier :id

  fields :name
  association :habit_rating, blueprint: HabitRatingBlueprint
  association :application_intentions, blueprint: ApplicationIntentionBlueprint
end