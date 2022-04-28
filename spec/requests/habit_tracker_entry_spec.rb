# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'HabitTrackerEntries', type: :request do
  let!(:user) { create(:user) }
  let!(:habit) { create(:habit) }
  let!(:unprocessed_habit_tracker_entry) { create(:habit_tracker_entry, completion_status: 'unprocessed') }
  let!(:processed_habit_tracker_entry) { create(:habit_tracker_entry, completion_status: 'succeeded') }
  let!(:processed_habit_tracker_entry) { create(:habit_tracker_entry, completion_status: 'failed') }

  describe 'GET /habit_tracker_entries' do
    context 'Get unprocessed habit tracker entries only' do
      before do
        get '/api/v1/habit_tracker_entries?completion_status=unprocessed',
            headers: { 'Authorization' => AuthenticationTokenService.call(user.id) }
      end
      it 'returns habit tracker entries with an unprocessed completion status' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body).size).to eq(1)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
    context 'Get all habit tracker entries' do
      before do
        get '/api/v1/habit_tracker_entries', headers: { 'Authorization' => AuthenticationTokenService.call(user.id) }
      end
      it 'returns all habit tracker entry records' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body).size).to eq(3)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  let(:valid_attributes) do
    {
      completion_status: 'succeeded'
    }
  end

  describe 'PUT /habit_tracker_entries/:id' do
    before do
      put "/api/v1/habit_tracker_entries/#{unprocessed_habit_tracker_entry.id}", params: valid_attributes,
                                                                                 headers: { 'Authorization' => AuthenticationTokenService.call(user.id) }
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
    it 'updates habit tracker entry' do
      updated_item = HabitTrackerEntry.find(unprocessed_habit_tracker_entry.id)
      expect(updated_item.completion_status).to match(/succeeded/)
    end
  end
end
