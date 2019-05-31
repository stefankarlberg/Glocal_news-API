class Articles::ShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :ingress, :body, :image, :created_at, :written_by, :country, :city
  belongs_to :category, serializer: Categories::IndexSerializer
end
