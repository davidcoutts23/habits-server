FactoryBot.define do
  factory :application_intention, class: ApplicationIntention do
    behaviour { Faker::Lorem.words(number: 1) }
    time { Faker::Lorem.words(number: 1) }
    location { Faker::Address.city }
    habit { create(:habit) }
  end
end
