class Articles::IndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :ingress, :image, :country, :city
  belongs_to :category, serializer: Categories::IndexSerializer
end
