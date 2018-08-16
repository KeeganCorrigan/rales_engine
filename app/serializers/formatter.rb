module Formatter
  def format_unit_price(number)
    number.to_s.insert(-3, ".")
  end
end