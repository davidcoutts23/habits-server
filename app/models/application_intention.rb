class ApplicationIntention < ApplicationRecord
  belongs_to :Habit
  validates :behaviour, presence: true
  validates :time, presence: true
  validates :location, presence: true
end
