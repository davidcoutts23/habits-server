class Habit < ApplicationRecord
  has_many :ApplicationIntention
  validates :name, presence: true
end
