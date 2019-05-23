class Api::V1::ArticlesController < ApplicationController

  def index
    @articles = Article.all
    render json: { entries: @articles }
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      render json: { message: 'all good' }
    else
      render json: { error: @article.errors.full_messages }
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :ingress, :body, :image)
  end
  
end