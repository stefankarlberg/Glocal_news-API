class Articles::ShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :ingress, :body, :image, :created_at, :written_by, :category_id
end
