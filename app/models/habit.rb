# frozen_string_literal: true

class Habit < ApplicationRecord
  has_many :application_intentions
  belongs_to :habit_rating
  validates :name, presence: true
  accepts_nested_attributes_for :application_intentions
  belongs_to :user
end
