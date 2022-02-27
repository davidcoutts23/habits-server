class Habit < ApplicationRecord
  has_many :ApplicationIntention
  validates :name, presence: true

  attr_accessor :id, :name
end
