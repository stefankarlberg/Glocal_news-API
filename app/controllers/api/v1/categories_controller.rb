class Api::V1::CategoriesController < ApplicationController

  def index
    categories = Category.all
    render json: { data: categories }
  end

  def create
    category = Category.create(category_params)
    if category.persisted?
      render json: { message: 'Successfully created' }
    else
      render status: 422, json: { error: category.errors.full_messages }
    end
  end

  def show
    category = Category.find(params[:id])
    render json: category
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
  
end
