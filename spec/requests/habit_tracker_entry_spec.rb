require 'rails_helper'

RSpec.describe "HabitTrackerEntries", type: :request do
  let!(:user) { create(:user) }
  let!(:habit) { create(:habit) }
  let!(:unprocessed_habit_tracker_entry) { create(:habit_tracker_entry, completion_status: "unprocessed")}
  let!(:processed_habit_tracker_entry) { create(:habit_tracker_entry, completion_status: "succeeded")}

  describe 'GET /unprocessed_habit_tracker_entries' do
    before { get '/api/v1/habit_tracker_entries?completion_status=unprocessed', headers: { 'Authorization' => AuthenticationTokenService.call(user.id)} }
    it 'returns habit tracker entries with an unprocessed completion status' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(1)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  let(:valid_attributes) do
    {
      completion_status: "succeeded"
    }
  end

  describe 'PUT /habit_tracker_entries/:id' do
    before { put "/api/v1/habit_tracker_entries/#{unprocessed_habit_tracker_entry.id}", params: valid_attributes, headers: { 'Authorization' => AuthenticationTokenService.call(user.id)} }
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
    # it 'updates habit' do
    #   updated_item = Habit.find(habit.id)
    #   expect(updated_item.name).to match(/Meditate daily/)
    #   expect(updated_item.habit_rating_id).to eq(habit_rating.id)
    # end
  end
end