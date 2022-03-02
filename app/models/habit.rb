class Habit < ApplicationRecord
  has_many :application_intentions
  belongs_to :habit_rating
  validates :name, presence: true
end
