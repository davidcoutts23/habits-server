# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Habit, type: :model do
  # Association test
  it { should have_many(:application_intentions) }
  # Validation tests
  it { should validate_presence_of(:name) }
  
  describe 'Associations' do
    it { should belong_to(:user) }
  end
end
