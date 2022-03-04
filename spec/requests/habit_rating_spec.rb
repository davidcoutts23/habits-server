require 'rails_helper'

RSpec.describe 'HabitRatings', type: :request do
  let!(:habit_rating) { create_list(:habit_rating, 3) }

  describe 'GET /habitRatings' do
    before { get '/api/v1/habit_ratings' }
    it 'returns ratings' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(3)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
