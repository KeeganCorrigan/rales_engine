class InvoiceItemSerializer < ActiveModel::Serializer
  include Formatter
  
  attributes :id, :invoice_id, :item_id, :quantity, :unit_price

  def unit_price
    format_unit_price(object.unit_price)
  end
end
