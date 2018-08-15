FactoryBot.define do
  factory :item do
    name "Vapor Staff"
    description "Dabs Bro - Wanna smork this?"
    unit_price 75107
    merchant { create(:merchant) }
    created_at "2013-03-27 14:53:59"
    updated_at "2013-03-27 14:53:59"
  end
end
