require 'rails_helper'

RSpec.describe "Habits", type: :request do
  before do
    HabitRating.new(rating: "Positive")
    HabitRating.new(rating: "Negative")  
    Habit.new(name: "Brush teeth", habit_rating_id: 1)
    Habit.new(name: "Drink beer", habit_rating_id: 2)
  end

  describe 'GET /habits' do
   before { get '/api/v1/habits' } 
    it 'returns habits' do
     expect(JSON.parse(response.body)).not_to be_empty
     expect(JSON.parse(response.body).size).to eq(2)
   end
   it 'returns status code 200' do
     expect(response).to have_http_status(200)
   end
  end
end
