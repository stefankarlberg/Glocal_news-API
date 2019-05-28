class Article < ApplicationRecord
  has_many :reviews
  validates_presence_of :title, :ingress, :body, :image, :written_by
end
