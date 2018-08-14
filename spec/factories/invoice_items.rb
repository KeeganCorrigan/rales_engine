FactoryBot.define do
  factory :invoice_item do
    item_id { create(:item).id }
    invoice { create(:invoice) }
    quantity { rand(1..9) }
    unit_price 6543
    created_at "2018-08-13 18:24:47"
    updated_at "2018-08-13 18:24:47"
  end
end
