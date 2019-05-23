class Api::V1::ArticlesController < ApplicationController
  def create
    @article = Article.new(params[:article])
    if @article.save
      render json: { message: 'all good'}
    end
  end

  def index
    @articles = Article.all
    render json: { entries: @articles }
  end
end