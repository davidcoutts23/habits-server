# frozen_string_literal: true

class Habit < ApplicationRecord
  has_many :application_intentions
  has_many :habit_tracker_entries
  belongs_to :habit_rating
  belongs_to :user

  validates :name, presence: true
  validates :days_of_week_active, presence: true

  accepts_nested_attributes_for :application_intentions

  def habit_tracker_weekly_progress
    Rails.logger.info self.id
    # current_week_progress = []
    # (DateTime.current.beginning_of_week..DateTime.current.beginning_of_week).map do |date|
    #   Rails.logger.info date
    # end
  end
end
