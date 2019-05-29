class Articles::IndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :ingress, :image
  belongs_to :category, serializer: Categories::IndexSerializer
end
