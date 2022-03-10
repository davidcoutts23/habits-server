require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'POST /register' do
    let(:valid_user_attributes) do
      {
        email: 'test@gmail.com',
        password: '1y2p3_tD2'
      }
    end
    let(:invalid_user_attributes_password_length) do
      {
        email: 'test@gmail.com',
        password: '1y2p'
      }
    end 
    context 'Register with valid user attributes' do
      it 'returns status code 201' do
        post '/api/v1/register', params: { user: valid_user_attributes } 
        expect(response).to have_http_status(201)
        expect(json).to eq({
                          'id' => User.last.id,
                          'email' => 'test@gmail.com',
                          # 'token' => AuthenticationTokenService.call(User.last.id)
                        })
      end
    end
    context 'Register with invalid user attributes (Password length)' do
      it 'returns status code 201' do
        post '/api/v1/register', params: { user: invalid_user_attributes_password_length } 
        expect(response).to have_http_status(422)
      end
    end
  end
  
end
