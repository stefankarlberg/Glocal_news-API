class Api::V1::CategoriesController < ApplicationController

  def index
    categories = Category.all
    render json: categories, each_serializer: Categories::IndexSerializer
  end
end
