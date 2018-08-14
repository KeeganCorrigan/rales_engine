class MerchantRevenueSerializer < ActiveModel::Serializer
  include Formatter
  
  attributes :revenue

  def revenue
    format_unit_price(object.total_revenue)
  end
end
