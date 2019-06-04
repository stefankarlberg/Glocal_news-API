class Article < ApplicationRecord
  has_many :reviews
  belongs_to :category
  validates_presence_of :title, :ingress, :body, :image, :written_by, :category_id, :country, :city
  validates :title, length: { minimum: 3, maximum: 50 }
  validates :ingress, length: { minimum: 50, maximum: 200 }
  validates :body, length: { minimum: 1000 }
end
