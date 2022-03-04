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

  describe 'POST /habits/:id' do
   let!(:habit_rating) { create(:habit_rating) }
   let(:valid_attributes) do
     { name: 'Brush my teeth',
       habit_rating_id: habit_rating.id }
   end
   context 'when request attributes are valid' do
     before { post '/api/v1/habits', params: valid_attributes }
     it 'returns status code 201' do
       expect(response).to have_http_status(201)
     end
   end
   context 'when an invalid request' do
     before { post '/api/v1/habits', params: {} }
     it 'returns status code 422' do
       expect(response).to have_http_status(422)
     end
     it 'returns a failure message' do
       expect(response.body).to include("can't be blank")
     end
   end
 end
end
