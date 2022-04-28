# frozen_string_literal: true

class CreateHabitTrackerEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :habit_tracker_entries do |t|
      t.integer :completion_status, null: false, default: 0
      t.references :habit, null: false, foreign_key: true
      t.timestamps
    end
  end
end
