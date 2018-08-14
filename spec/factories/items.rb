FactoryBot.define do
  factory :item do
    name "Vapor Staff"
    description "Dabs Bro - Wanna smork this?"
    unit_price 75107
    merchant { create(:merchant) }
    created_at { 3.years.ago}
    updated_at { 2.years.ago}
  end
end
