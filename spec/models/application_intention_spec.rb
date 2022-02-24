require 'rails_helper'

RSpec.describe ApplicationIntention, type: :model do
  it { should validate_presence_of(:behaviour) }
  it { should validate_presence_of(:time) }
  it { should validate_presence_of(:location) }
end
