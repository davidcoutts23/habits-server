require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it {
    should validate_length_of(:email)
      .is_at_least(3)
  }
  it { should validate_presence_of(:password) }
  it {
    should_not validate_length_of(:password)
      .is_at_least(5)
  }
  describe 'Associations' do
    it { should have_many(:habits) }
 end
end
