require 'rails_helper'

RSpec.describe "Habits", type: :request do

  let!(:habits) { create(:habit) }

  describe 'GET /habits' do
   before { get '/api/v1/habits' } 
    it 'returns habits' do
     expect(JSON.parse(response.body)).not_to be_empty
     expect(JSON.parse(response.body).size).to eq(1)
   end
   it 'returns status code 200' do
     expect(response).to have_http_status(200)
   end
  end
end
