class Articles::IndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :ingress, :image, :published, :country, :city
  belongs_to :category, serializer: Categories::IndexSerializer
end
