# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_220_427_040_401) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'application_intentions', force: :cascade do |t|
    t.string 'behaviour'
    t.string 'time'
    t.string 'location'
    t.bigint 'habit_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['habit_id'], name: 'index_application_intentions_on_habit_id'
  end

  create_table 'habit_ratings', force: :cascade do |t|
    t.string 'rating'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'colour'
  end

  create_table 'habit_tracker_entries', force: :cascade do |t|
    t.integer 'completion_status', default: 0, null: false
    t.bigint 'habit_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.datetime 'effective_date'
    t.index ['habit_id'], name: 'index_habit_tracker_entries_on_habit_id'
  end

  create_table 'habits', force: :cascade do |t|
    t.string 'name'
    t.bigint 'habit_rating_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id'
    t.string 'days_of_week_active', default: [], array: true
    t.index ['habit_rating_id'], name: 'index_habits_on_habit_rating_id'
    t.index ['user_id'], name: 'index_habits_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email'
    t.string 'password_digest'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'application_intentions', 'habits'
  add_foreign_key 'habit_tracker_entries', 'habits'
  add_foreign_key 'habits', 'habit_ratings'
  add_foreign_key 'habits', 'users'
end
