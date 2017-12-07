class FoodSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :image_url
  belongs_to :category
  belongs_to :restaurant
end
