class Articles::IndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :ingress, :image
end