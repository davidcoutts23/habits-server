class Habit < ApplicationRecord
  belongs_to :HabitRating
  has_many :ApplicationIntention
  validates :name, presence: true
end
