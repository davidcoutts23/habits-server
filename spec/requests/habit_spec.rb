# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Habits', type: :request do
  let!(:habits) { create(:habit) }
  let!(:user) { create(:user) }

  describe 'GET /habits' do
    before { get '/api/v1/habits', headers: { 'Authorization' => AuthenticationTokenService.call(user.id)} }
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
    let!(:user) { create(:user) }
    let(:valid_attributes_application_intention) do
      {
        name: 'I will meditate every day',
        habit_rating_id: habit_rating.id,
        user_id: user.id,
        application_intentions_attributes: [
          {
            behaviour: 'meditate for 20 mins',
            time: 'when I wake up every day',
            location: 'in the lounge room'
          }
        ]
      }
    end
    let(:valid_attributes) do
      {
        name: 'I will meditate every day',
        habit_rating_id: habit_rating.id,
        user_id: user.id,
      }
    end
    context 'when request attributes including application intention are valid' do
      before { post '/api/v1/habits', params: valid_attributes_application_intention, headers: { 'Authorization' => AuthenticationTokenService.call(user.id)} }
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
    context 'when request attributes with no application intention are valid' do
      before { post '/api/v1/habits', params: valid_attributes, headers: { 'Authorization' => AuthenticationTokenService.call(user.id)} }
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
    context 'when an invalid request' do
      before { post '/api/v1/habits', params: {}, headers: { 'Authorization' => AuthenticationTokenService.call(user.id)} }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a failure message' do
        expect(response.body).to include("can't be blank")
      end
    end
  end
end
