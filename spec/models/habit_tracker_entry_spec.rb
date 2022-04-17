require 'rails_helper'

RSpec.describe HabitTrackerEntry, type: :model do
  it { should validate_presence_of(:completion_status) }
  it { should define_enum_for(:completion_status).with([:unknown, :completed, :missed]) }
end