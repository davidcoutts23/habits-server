# frozen_string_literal: true

class HabitTrackerEntry < ApplicationRecord
  validates :completion_status, presence: true
  enum :completion_status, %i[unprocessed succeeded failed unknown]
  belongs_to :habit
end
