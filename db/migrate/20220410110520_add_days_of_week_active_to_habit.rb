class AddDaysOfWeekActiveToHabit < ActiveRecord::Migration[7.0]
  def change
    add_column :habits, :days_of_week_active, :integer, array: true, default: []
  end
end
