# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ApplicationIntentions', type: :request do
  let!(:application_intention) { create(:application_intention) }
  let!(:user) { create(:user) }

  describe 'GET /application_intentions' do
    before { get '/api/v1/application_intentions', headers: { 'Authorization' => AuthenticationTokenService.call(user.id)} }
    it 'returns application intentions' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(1)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /application_intention/:id' do
    let!(:habit) { create(:habit) }
    let(:valid_attributes) do
      { behaviour: 'Meditate',
        time: 'Every morning after I wake up',
        location: 'Lounge rooom',
        habit_id: habit.id }
    end
    context 'when request attributes are valid' do
      before { post '/api/v1/application_intentions', params: valid_attributes, headers: { 'Authorization' => AuthenticationTokenService.call(user.id)} }
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
    context 'when an invalid request' do
      before { post '/api/v1/application_intentions', params: {}, headers: { 'Authorization' => AuthenticationTokenService.call(user.id)} }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a failure message' do
        expect(response.body).to include("can't be blank")
      end
    end
  end
end
