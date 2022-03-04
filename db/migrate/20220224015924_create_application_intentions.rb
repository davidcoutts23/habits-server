# frozen_string_literal: true

class CreateApplicationIntentions < ActiveRecord::Migration[7.0]
  def change
    create_table :application_intentions do |t|
      t.string :behaviour
      t.string :time
      t.string :location
      t.references :habit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
