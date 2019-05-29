require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }
  let(:article) { FactoryBot.create(:article) }

  describe 'POST /api/v1/articles/id/reviews' do
    describe 'successfully' do
      before do
        post "/api/v1/articles/"+"#{article.id}"+"/reviews", params: {
          review: { 
            score: 8, 
            comment: "Good article, well done!"
          }
        }, headers: headers
      end

      it 'creates a review entry' do
        expect(json_response['message']).to eq 'Successfully created'
      end

      it 'sends back the newly created reviews score as a response ' do
        expect(json_response['score']).to eq 8
      end

      it 'sends back the newly created reviews comment as a response ' do
        expect(json_response['comment']).to eq "Good article, well done!"
      end

      it 'attaches the review to the correct article' do
        expect(article.reviews.last.comment).to eq "Good article, well done!"
      end
    end

    describe 'unsuccessfully' do
      it 'can not be created without providing both, score and comment' do
        post "/api/v1/articles/"+"#{article.id}"+"/reviews", params: {
          review: {
            score: 8
          }
        }, headers: headers
      
        expect(json_response['error']).to eq ["Comment can't be blank"]
      end
    end
  end 
end