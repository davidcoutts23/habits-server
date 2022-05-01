# frozen_string_literal: true

class CreateHabitTrackingEntriesDailyJob
  include Sidekiq::Job

  def perform
    Habit.all.each do |habit|
      if (habit.days_of_week_active.include? current_day_of_week) && (habit_tracker_entry_dates(habit.id).exclude? DateTime.current.beginning_of_day)
        HabitTrackerEntry.create(completion_status: 0, habit_id: habit.id,
                                 effective_date: Date.current.beginning_of_day)
      end
    end
  end

  private

  def current_day_of_week
    Time.now.strftime('%A').downcase
  end

  def habit_tracker_entry_dates(habit_id)
    HabitTrackerEntry.where(habit_id: habit_id).pluck(:effective_date)
  end
end