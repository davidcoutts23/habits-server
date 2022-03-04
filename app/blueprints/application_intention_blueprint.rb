class ApplicationIntentionBlueprint < Blueprinter::Base
  identifier :id

  fields :behaviour, :time, :location
end
