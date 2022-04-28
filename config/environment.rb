# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Configure logger
# Rails.logger = Logger.new(STDOUT)
Rails.logger.level = Logger::DEBUG

# logger = ActiveSupport::Logger.new($stdout)
# logger.formatter = config.log_formatter
# config.logger = logger
