require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe 'POST /api/v1/articles/id/reviews/id' do
    describe 'successfully' do
      before do
        post "/api/v1/articles/"+"#{article.id}"+"/reviews/"+"#{review.id}", params: {
          review: { 
            score: 8, 
            comment: "Good article, well done!"
          }
        }, headers: headers
      end

      it 'creates a review entry' do
        expect(json_response['message']).to eq 'Successfully created'
      end

      it 'sends back the newly created review as a response ' do
        article = Article.last
        review = article.review.last
        expect(json_response.body).to eq [{"score": "8", "comment": "Good article, well done!"}]
      end

      it 'attaches the review to the correct article' do
        article = Article.last
        review = article.review.last
        expect(review[:article_id]).to eq article.id
      end
    end
  end

  describe 'POST /api/v1/articles/id/reviews/id' do
    describe 'unsuccessfully' do

      it 'can not be created without providing both, score and comment' do
        post "/api/v1/articles/"+"#{article.id}"+"/reviews/"+"#{review.id}", params: {
          review: {
            score: 8
         }
        }, headers: headers
      
        expect(json_response['error']).to eq ["Comment can't be blank"]
      end
    end
  end

end