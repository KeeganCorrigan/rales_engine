class MerchantRevenueDateSerializer < ActiveModel::Serializer
  include Formatter

  attributes :revenue

  def revenue
    format_unit_price(object.total_by_date(@instance_options[:option_name]))
  end
end
