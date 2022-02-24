require 'rails_helper'

RSpec.describe "HabitRatings", type: :request do
  let!(:rating) { build(:habit_rating) }
  # let!(:rating_id) { ratings.first.id }

  


  describe 'GET /habitRatings' do
   before { get '/api/v1/habit_rating' } 
    it 'returns ratings' do
     expect(json).not_to be_empty
     expect(json.size).to eq(5)
   end
   it 'returns status code 200' do
     expect(response).to have_http_status(200)
   end
  end
end
