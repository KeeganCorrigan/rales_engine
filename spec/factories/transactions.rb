FactoryBot.define do
  factory :transaction do
    invoice { create(:invoice) }
    credit_card_number "4654405418249632"
    result "success"
    updated_at { 1.years.ago }
    created_at { 2.years.ago }
  end
end
