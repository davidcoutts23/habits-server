# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ApplicationIntentions', type: :request do
  let!(:application_intention) { create(:application_intention) }
  let!(:user) { create(:user) }

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
