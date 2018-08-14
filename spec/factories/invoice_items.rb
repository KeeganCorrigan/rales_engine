FactoryBot.define do
  factory :invoice_item do
    item { create(:item) }
    invoice { create(:invoice) }
    quantity rand(1..9)
    unit_price { item.unit_price }
    created_at "2018-08-13 18:24:47"
    updated_at "2018-08-13 18:24:47"
  end
end
