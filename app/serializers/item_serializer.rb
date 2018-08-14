class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :merchant_id, :unit_price
end