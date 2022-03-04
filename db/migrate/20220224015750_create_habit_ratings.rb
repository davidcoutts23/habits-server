# frozen_string_literal: true

class CreateHabitRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :habit_ratings do |t|
      t.string :rating

      t.timestamps
    end
  end
end
