class ItemSerializer < ActiveModel::Serializer
  include Formatter
  
  attributes :id, :name, :description, :merchant_id, :unit_price

  def unit_price
    format_unit_price(object.unit_price)
  end
end