class HabitRating < ApplicationRecord
    has_one :Habit
    validates :rating, presence: true
end
