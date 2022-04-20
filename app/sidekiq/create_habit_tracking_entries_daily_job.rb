class CreateHabitTrackingEntriesDailyJob
  include Sidekiq::Job

  def perform()
    Habit.all.each do |habit|
      if habit.days_of_week_active.include? current_day_of_week
        if habit_tracker_entry_dates(habit.id).exclude? Time.now.strftime("%m/%d/%Y")
          HabitTrackerEntry.create(completion_status: 0, habit_id: habit.id)
        end
      end
    end
  end

  private

  def current_day_of_week()
    Time.now.strftime("%A").downcase
  end

  def habit_tracker_entry_dates(habit_id)
    HabitTrackerEntry.where(habit_id:habit_id).pluck(:created_at).map { |date| date.strftime('%m/%d/%Y')}
  end
end

# 