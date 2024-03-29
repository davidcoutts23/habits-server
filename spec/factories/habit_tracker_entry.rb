# frozen_string_literal: true

FactoryBot.define do
  factory :habit_tracker_entry, class: HabitTrackerEntry do
    habit { create(:habit) }
  end
end
