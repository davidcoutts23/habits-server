# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Habit, type: :model do
  # Validation tests
  it { should validate_presence_of(:name) }
  # it { should validate_presence_of(:days_of_week_active) }

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:application_intentions) }
    it { should have_many(:habit_tracker_entries) }
  end
end
