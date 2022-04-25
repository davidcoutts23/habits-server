require 'rails_helper'

RSpec.describe "HabitTrackerEntries", type: :request do
  let!(:user) { create(:user) }
  let!(:habit) { create(:habit) }
  let!(:unprocessed_habit_tracker_entry) { create(:habit_tracker_entry, completion_status: "unknown")}
  let!(:completed_habit_tracker_entry) { create(:habit_tracker_entry, completion_status: "completed")}

  describe 'GET /unprocessed_habit_tracker_entries' do
    before { get '/api/v1/habit_tracker_entries?completion_status=unknown', headers: { 'Authorization' => AuthenticationTokenService.call(user.id)} }
    it 'returns habit tracker entries with an unknown completion status' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(1)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end