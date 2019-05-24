require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe 'GET /api/v1/article' do
    before do
      5.times { FactoryBot.create(:article) }
    end

    it 'returns a collection of articles' do
      get '/api/v1/articles', headers: headers
      expect(json_response['entries'].count).to eq 5
    end

    it 'returns 200 response' do
      get '/api/v1/articles', headers: headers
      expect(response.status).to eq 200
    end
  end

  describe 'GET /api/v1/articles/' do
    it 'returns a specific article' do
      get '/api/v1/articles', headers: headers
      id=JSON.parse(response.body).entries[0][1][0]['id']
      get "/api/v1/articles/"+"#{id}", headers: headers
    end
  end
      #  expect(json_response.body['entries'][0][0]).to eq ['id']

  describe 'POST /api/v1/articles' do
    it 'creates an article entry' do
      post '/api/v1/articles', params: {
        article: { 
          title: 'Gothenburg is great', 
          ingress: 'According to many', 
          body: 'Not many people really think that Stockholm is a better place to live in', 
          image: 'https://assets.craftacademy.se/images/people/students_group.png',
          written_by: 'Steffe Karlberg'
        }
      }, headers: headers

      expect(json_response['message']).to eq 'Successfully created'
      expect(response.status).to eq 200
    end

    it 'can not be created without all fields filled in' do
      post '/api/v1/articles', params: {
        article: {
          title: "Stockolm is not too bad",
          written_by: 'Steffe Karlberg'
        }
      }, headers: headers
      
      expect(json_response['error']).to eq ["Ingress can't be blank", "Body can't be blank", "Image can't be blank"]
      expect(response.status).to eq 422
    end

  end
end
