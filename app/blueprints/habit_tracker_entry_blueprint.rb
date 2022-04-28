# frozen_string_literal: true

class HabitTrackerEntryBlueprint < Blueprinter::Base
  identifier :id

  fields :completion_status, :habit_id, :effective_date
end