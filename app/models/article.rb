class Article < ApplicationRecord
  validates_presence_of :title, :ingress, :body, :image, :written_by
end
