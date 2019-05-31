class Api::V1::ArticlesController < ApplicationController
  before_action :authenticate_api_v1_user!, only: [:create, :show]

  def index
    articles = Article.all
    render json: articles, each_serializer: Articles::IndexSerializer
  end

  def create
    article = Article.create(article_params)
    if article.persisted?
      render json: { message: 'Successfully created', article_id: article.id }
    else
      render json: { error: article.errors.full_messages }, status: 422
    end
  end

  def show
    article = Article.find(params[:id])
    render json: article, serializer: Articles::ShowSerializer
  end

  private

  def article_params
    params.require(:article).permit(:title, :ingress, :body, :image, :written_by, :category_id, :country, :city)
  end
  
end
