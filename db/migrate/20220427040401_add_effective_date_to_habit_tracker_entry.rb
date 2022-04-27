class AddEffectiveDateToHabitTrackerEntry < ActiveRecord::Migration[7.0]
  def change
    add_column :habit_tracker_entries, :effective_date, :datetime
  end
end
