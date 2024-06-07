require 'rails_helper'

RSpec.describe 'Sports API', type: :request do
  let(:user) { create(:user) }
  let(:headers) { user.create_new_auth_token }
  let!(:sports) { create_list(:sport, 10) }
  let(:sport_id) { sports.first.id }

  describe 'GET /api/v1/sports' do
    before { get '/api/v1/sports', headers: headers }

    it 'returns sports' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/sports/:id' do
    before { get "/api/v1/sports/#{sport_id}", headers: headers }

    context 'when the record exists' do
      it 'returns the sport' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(sport_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:sport_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Sport/)
      end
    end
  end

  describe 'POST /api/v1/sports' do
    let(:valid_attributes) { { name: 'Basketball' } }

    context 'when the request is valid' do
      before { post '/api/v1/sports', params: { sport: valid_attributes }, headers: headers }

      it 'creates a sport' do
        expect(json['name']).to eq('Basketball')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/sports', params: { sport: { name: '' } }, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Name can't be blank/)
      end
    end
  end

  describe 'PUT /api/v1/sports/:id' do
    let(:valid_attributes) { { name: 'Soccer' } }

    context 'when the record exists' do
      before { put "/api/v1/sports/#{sport_id}", params: { sport: valid_attributes }, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /api/v1/sports/:id' do
    before { delete "/api/v1/sports/#{sport_id}", headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
