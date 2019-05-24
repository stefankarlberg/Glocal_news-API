class Api::V1::ArticlesController < ApplicationController

  def index
    @articles = Article.all
    render json: { entries: @articles }
  end

  def create
    @article = Article.create(article_params)
    if @article.persisted?
      render json: { message: 'Successfully created' }
    else
      render status: 422, json: { error: @article.errors.full_messages }
    end
  end

  def show
    @article = Article.find(params[:id])
    render json: { entries: @article }
  end

  private

  def article_params
    params.require(:article).permit(:title, :ingress, :body, :image, :written_by)
  end
  
end