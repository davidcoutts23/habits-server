class HabitTrackerEntry < ApplicationRecord
    validates :completion_status, presence: true
    enum :completion_status, [:unprocessed, :succeeded, :failed, :unknown]
    belongs_to :habit
end
