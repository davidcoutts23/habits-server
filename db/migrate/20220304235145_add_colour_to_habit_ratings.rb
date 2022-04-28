# frozen_string_literal: true

class AddColourToHabitRatings < ActiveRecord::Migration[7.0]
  def change
    add_column :habit_ratings, :colour, :string
  end
end
