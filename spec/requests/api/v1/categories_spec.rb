require 'rails_helper'

RSpec.describe Api::V1::CategoriesController, type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe 'GET /api/v1/categories' do
    before do
      5.times { FactoryBot.create(:category) }
    end

    it 'returns a collection of categories' do
      get '/api/v1/categories', headers: headers
      expect(json_response['entries'].count).to eq 5
    end

    it 'returns 200 response' do
      get '/api/v1/categories', headers: headers
      expect(response.status).to eq 200
    end
  end

  describe 'GET /api/v1/articles/id' do
    let(:category) { FactoryBot.create(:category)}
    before do
      get "/api/v1/categories/"+"#{category.id}", headers: headers
    end

    it 'returns a specific category' do
      expect(json_response['id']).to eq category.id
    end

    it 'returns 200 response' do
      expect(response.status).to eq 200
    end
  end

  describe 'POST /api/v1/categories' do
    it 'creates category entry' do
     post '/api/v1/categories', params: {
        category: { 
          name: 'Culture'
        } 
      }, headers: headers
      expect(json_response['message']).to eq 'Successfully created'
      expect(response.status).to eq 200
    end
  
    it 'can not be created without name field filled in' do
      post '/api/v1/categories', params: {
        category: {
          name: ''
        }
      }, headers: headers
      expect(json_response['error']).to eq ["Name can't be blank"]
      expect(response.status).to eq 422
    end

  end
end
