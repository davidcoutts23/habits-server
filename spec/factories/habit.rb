FactoryBot.define do
  factory :habit, class: Habit do
    name { Faker::Lorem.words(number: 1) }
    habit_rating { create(:habit_rating) }
  end
end
