require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe 'POST /api/v1/article' do
    it 'creates an article entry' do
      post '/api/v1/article', params: {
        article: { data: { 
          title: 'Gothenburg is a great city', 
          ingress: 'The Gothenburg population is the most happy people in Sweden according to Zane.', 
          body: 'The Gothenburg population is the most happy people in Sweden according to Zane.',
          image: 'https://www.freepik.com/'}}
      }, headers: headers

      entry = Article.last
      expect(entry.data).to eq 'title' => 'Gothenburg is a great city'
    end
  end
end
