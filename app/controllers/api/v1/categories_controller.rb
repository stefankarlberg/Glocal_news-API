class Api::V1::CategoriesController < ApplicationController

  def index
    categories = Category.all
    render json: { categories: categories }, each_serializer: Categories::IndexSerializer
  end
end
