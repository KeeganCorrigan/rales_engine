class MerchantsRevenueByDateSerializer < ActiveModel::Serializer
  include Formatter
  
  attributes :total_revenue

  def total_revenue
    format_unit_price(object.revenue_by_date(@instance_options[:option_name]))
  end
end