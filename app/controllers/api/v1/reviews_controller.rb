class Api::V1::ReviewsController < ApplicationController
  after_action :publish?, only: :create


  def create
    article = Article.find(params[:article_id])
    review = article.reviews.create(review_params)
    if review.persisted?
      render json: { message: 'Successfully created', review_id: review.id, score: review.score, comment: review.comment }
    else
      render json: { error: review.errors.full_messages }
    end
  end
  
  private
    def review_params
      params.require(:review).permit(:score, :comment)
    end

    def publish?
      article = Article.find(params[:article_id])
      if article.reviews.count >= 3
        article.update(published: :true)
      end
    end
end
