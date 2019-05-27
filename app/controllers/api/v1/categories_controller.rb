class Api::V1::CategoriesController < ApplicationController

  def index
    categories = Category.all
    render json: { data: categories }, each_serializer: Categories::IndexSerializer
  end
end
