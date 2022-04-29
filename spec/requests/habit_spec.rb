# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Habits', type: :request do
  let!(:user) { create(:user) }
  let!(:habit_rating) { create(:habit_rating) }
  let!(:habit) { create(:habit, user_id: user.id) }
  let(:valid_attributes_application_intention) do
    {
      name: 'I will meditate every day',
      habit_rating_id: habit_rating.id,
      days_of_week_active: [1, 2, 3, 4, 5, 6, 7],
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
      name: 'Meditate daily',
      habit_rating_id: habit_rating.id,
      days_of_week_active: %w[monday tuesday wednesday thursday friday saturday sunday]
    }
  end

  describe 'GET /habits' do
    before { get '/api/v1/habits', headers: { 'Authorization' => AuthenticationTokenService.call(user.id) } }
    it 'returns habits' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(1)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /habits/:id' do
    context 'when request attributes including application intention are valid' do
      before do
        post '/api/v1/habits', params: valid_attributes_application_intention,
                               headers: { 'Authorization' => AuthenticationTokenService.call(user.id) }
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
    context 'when request attributes with no application intention are valid' do
      before do
        post '/api/v1/habits', params: valid_attributes,
                               headers: { 'Authorization' => AuthenticationTokenService.call(user.id) }
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
    context 'when an invalid request' do
      before do
        post '/api/v1/habits', params: {}, headers: { 'Authorization' => AuthenticationTokenService.call(user.id) }
      end
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a failure message' do
        expect(response.body).to include("can't be blank")
      end
    end
  end

  describe 'PUT /habits/:id' do
    context 'when habit exists' do
      before do
        put "/api/v1/habits/#{habit.id}", params: valid_attributes,
                                          headers: { 'Authorization' => AuthenticationTokenService.call(user.id) }
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
      it 'updates habit' do
        updated_item = Habit.find(habit.id)
        expect(updated_item.name).to match(/Meditate daily/)
        expect(updated_item.habit_rating_id).to eq(habit_rating.id)
      end
    end
  end

  describe 'DELETE /habits/:id' do
    context 'when habit exists' do
      before do
        delete "/api/v1/habits/#{habit.id}", headers: { 'Authorization' => AuthenticationTokenService.call(user.id) }
      end
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'GET /habits/:id/habit_tracker_weekly_progress' do
      pending "add some examples to (or delete) #{__FILE__}"
  end
end
