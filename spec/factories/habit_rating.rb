FactoryBot.define do
  factory :habit_rating, class: HabitRating do
    rating { Faker::Lorem.words(number: 1) }
  end
end
