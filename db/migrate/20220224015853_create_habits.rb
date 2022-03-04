# frozen_string_literal: true

class CreateHabits < ActiveRecord::Migration[7.0]
  def change
    create_table :habits do |t|
      t.string :name
      t.references :habit_rating, null: false, foreign_key: true

      t.timestamps
    end
  end
end
