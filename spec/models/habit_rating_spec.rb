require 'rails_helper'

RSpec.describe HabitRating, type: :model do
  # Association test
 it { should have_one(:habit) }
 # Validation tests
 it { should validate_presence_of(:rating) }
end
