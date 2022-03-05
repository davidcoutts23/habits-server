# frozen_string_literal: true

class HabitRatingBlueprint < Blueprinter::Base
  identifier :id

  fields :rating, :colour
end
