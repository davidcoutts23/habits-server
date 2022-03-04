# frozen_string_literal: true

class HabitRating < ApplicationRecord
  has_one :habit
  validates :rating, presence: true
end
