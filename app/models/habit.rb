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
    week_progress = []
    (DateTime.current.beginning_of_week..DateTime.current.end_of_week).each do |date| 
      week_progress.push({
        "date" => date,
        "day_of_week" => date.strftime("%A"),
        "completion_status" => "undefined"
      })
      HabitTrackerEntry.where(habit_id: self.id).each do |habit_tracker_entry|
        if date == habit_tracker_entry.effective_date
          week_progress.last["completion_status"] = habit_tracker_entry.completion_status
        end
      end
    end
    return week_progress
  end
end
