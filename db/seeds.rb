# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationIntention.destroy_all
HabitTrackerEntry.destroy_all
Habit.destroy_all
HabitRating.destroy_all
User.destroy_all

HabitRating.create(rating: 'Positive', colour: 'success')
HabitRating.create(rating: 'Negative', colour: 'danger')

User.create(email: 'test@test.com', password: 'red@apple_soup!')

Habit.create(name: 'Meditate daily', habit_rating_id: HabitRating.first.id, user_id: User.first.id,
             days_of_week_active: %w[monday tuesday wednesday thursday friday saturday sunday])
Habit.create(name: "Don't drink beer during the week", habit_rating_id: HabitRating.second.id, user_id: User.first.id,
             days_of_week_active: %w[monday tuesday wednesday thursday])

ApplicationIntention.create(habit_id: Habit.first.id, behaviour: 'perform the waking up daily meditation',
                            time: 'start work', location: 'study')
ApplicationIntention.create(habit_id: Habit.second.id,
                            behaviour: 'grab a non alcoholic drink when I would have a beer', time: 'go to the fridge', location: 'kitchen')

HabitTrackerEntry.create(habit_id: Habit.first.id, completion_status: 'unprocessed',
                         effective_date: DateTime.current.beginning_of_day)
HabitTrackerEntry.create(habit_id: Habit.first.id, completion_status: 'succeeded',
                         effective_date: (DateTime.current- 1.days).beginning_of_day)
HabitTrackerEntry.create(habit_id: Habit.first.id, completion_status: 'succeeded',
                         effective_date: (DateTime.current - 2.days).beginning_of_day)
HabitTrackerEntry.create(habit_id: Habit.first.id, completion_status: 'succeeded',
                         effective_date: (DateTime.current - 3.days).beginning_of_day)
HabitTrackerEntry.create(habit_id: Habit.first.id, completion_status: 'failed',
                         effective_date: (DateTime.current - 4.days).beginning_of_day)
HabitTrackerEntry.create(habit_id: Habit.first.id, completion_status: 'succeeded',
                         effective_date: (DateTime.current - 5.days).beginning_of_day)
HabitTrackerEntry.create(habit_id: Habit.first.id, completion_status: 'succeeded',
                         effective_date: (DateTime.current - 6.days).beginning_of_day)

HabitTrackerEntry.create(habit_id: Habit.second.id, completion_status: 'unprocessed',
                         effective_date: DateTime.current.beginning_of_day)
HabitTrackerEntry.create(habit_id: Habit.second.id, completion_status: 'succeeded',
                         effective_date: (DateTime.current - 1.days).beginning_of_day)
HabitTrackerEntry.create(habit_id: Habit.second.id, completion_status: 'failed',
                         effective_date: (DateTime.current - 2.days).beginning_of_day)
HabitTrackerEntry.create(habit_id: Habit.second.id, completion_status: 'succeeded',
                         effective_date: (DateTime.current - 3.days).beginning_of_day)
HabitTrackerEntry.create(habit_id: Habit.second.id, completion_status: 'succeeded',
                         effective_date: (DateTime.current - 4.days).beginning_of_day)
