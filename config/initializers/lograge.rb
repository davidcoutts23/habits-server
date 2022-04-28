# frozen_string_literal: true

Rails.application.configure do
  # Lograge config
  config.lograge.enabled = true

  # Log to STDOUT
  config.lograge.logger = ActiveSupport::Logger.new($stdout)
end
