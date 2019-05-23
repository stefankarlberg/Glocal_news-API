class Article < ApplicationRecord
  validates_presence_of :title, :ingress, :body, :image
end
