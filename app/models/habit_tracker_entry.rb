class HabitTrackerEntry < ApplicationRecord
    validates :completion_status, presence: true
    enum :completion_status, [:unknown, :completed, :missed]
    belongs_to :habit
end
