require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  # describe 'POST /api/v1/article' do
  #   it 'creates an article entry' do
  #     post '/api/v1/article', params: {
  #       article: { data: { 
  #         title: 'Gothenburg is a great city', 
  #         ingress: 'The Gothenburg population is the most happy people in Sweden according to Zane.', 
  #         body: 'The Gothenburg population is the most happy people in Sweden according to Zane.',
  #         image: 'https://www.freepik.com/'}}
  #     }, headers: headers

  #     entry = Article.last
  #     expect(entry.data).to eq 'title' => 'Gothenburg is a great city'
  #   end
  # end

  describe 'GET /api/v1/article' do
    before do
      Article.create({ 
        title: 'Gothenburg is a great city', 
        ingress: 'The Gothenburg population is the most happy people in Sweden according to Zane.', 
        body: 'The Gothenburg population is the most happy people in Sweden according to Zane.',
        image: 'https://www.freepik.com/'
      })
    end

    it 'returns an article' do
      get '/api/v1/article', headers:headers
      expect(json_response['entries'].count).to eq 1
    end
  end
end
