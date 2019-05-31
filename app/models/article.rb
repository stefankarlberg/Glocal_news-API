class Article < ApplicationRecord
  has_many :reviews
  belongs_to :category
  validates_presence_of :title, :ingress, :body, :image, :written_by, :category_id, :country, :city
end

