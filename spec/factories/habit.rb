# frozen_string_literal: true

FactoryBot.define do
  factory :habit, class: Habit do
    name { Faker::Lorem.words(number: 1) }
    habit_rating { create(:habit_rating) }
    user { create(:user) }
    days_of_week_active { [1, 2, 3, 4, 5, 6, 7] }
  end
end
