class Articles::IndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :ingress, :body, :image, :published, :created_at, :written_by, :country, :city
  belongs_to :category, serializer: Categories::IndexSerializer
end
