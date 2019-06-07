class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :price
  has_one :user
end
