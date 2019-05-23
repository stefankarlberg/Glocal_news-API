require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe 'GET /api/v1/article' do
    before do
      5.times { FactoryBot.create(:article)}
    end

    it 'returns an article' do
      get '/api/v1/articles', headers: headers
      expect(json_response['entries'].count).to eq 5
    end

    it 'returns 200 response' do
      get '/api/v1/articles', headers: headers
      expect(response.status).to eq 200
    end
  end
end
