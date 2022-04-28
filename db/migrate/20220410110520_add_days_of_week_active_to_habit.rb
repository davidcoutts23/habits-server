# frozen_string_literal: true

class AddDaysOfWeekActiveToHabit < ActiveRecord::Migration[7.0]
  def change
    add_column :habits, :days_of_week_active, :string, array: true, default: []
  end
end
