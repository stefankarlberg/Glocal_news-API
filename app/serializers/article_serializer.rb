class ArticleSerializer < ActiveModel::Serializer
    attributes :title, :body, :ingress, :image
end