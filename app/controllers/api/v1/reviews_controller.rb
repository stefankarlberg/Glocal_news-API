class Api::V1::ReviewsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    review = @article.reviews.create(review_params)
  end
  
  private
    def review_params
      params.require(:review).permit(:score, :comment)
    end
end
