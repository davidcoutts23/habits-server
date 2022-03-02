class Habit < ApplicationRecord
  has_many :ApplicationIntention
  belongs_to :HabitRating
  validates :name, presence: true
end
