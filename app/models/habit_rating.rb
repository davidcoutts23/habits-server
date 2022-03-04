class HabitRating < ApplicationRecord
  has_one :habit
  validates :rating, presence: true
end
