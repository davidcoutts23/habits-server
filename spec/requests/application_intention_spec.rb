# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ApplicationIntentions', type: :request do
  let!(:application_intention) { create(:application_intention) }
  let!(:user) { create(:user) }
  let!(:habit) { create(:habit) }
  let(:valid_attributes) do
    { behaviour: 'Meditate',
      time: 'Every morning after I wake up',
      location: 'Lounge rooom',
      habit_id: habit.id }
  end

  describe 'POST /application_intentions/:id' do
    context 'when request attributes are valid' do
      before do
        post '/api/v1/application_intentions', params: valid_attributes,
                                               headers: { 'Authorization' => AuthenticationTokenService.call(user.id) }
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
    context 'when an invalid request' do
      before do
        post '/api/v1/application_intentions', params: {},
                                               headers: { 'Authorization' => AuthenticationTokenService.call(user.id) }
      end
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a failure message' do
        expect(response.body).to include("can't be blank")
      end
    end
  end

  describe 'PUT /application_intentions/:id' do
    context 'when application intention exists' do
      before do
        put "/api/v1/application_intentions/#{application_intention.id}", params: valid_attributes,
                                                                          headers: { 'Authorization' => AuthenticationTokenService.call(user.id) }
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
      it 'updates application intention' do
        updated_item = ApplicationIntention.find(application_intention.id)
        expect(updated_item.behaviour).to match(/Meditate/)
      end
    end
  end

  describe 'DELETE /application_intentions/:id' do
    context 'when application intention exists' do
      before do
        delete "/api/v1/application_intentions/#{application_intention.id}",
               headers: { 'Authorization' => AuthenticationTokenService.call(user.id) }
      end
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
