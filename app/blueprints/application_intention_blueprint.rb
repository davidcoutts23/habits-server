# frozen_string_literal: true

class ApplicationIntentionBlueprint < Blueprinter::Base
  identifier :id

  fields :behaviour, :time, :location
end
