FactoryBot.define do
  factory :transaction do
    invoice { create(:invoice) }
    credit_card_number "4654405418249632"
    credit_card_expiration_date ""
    result "success"
    created_at "2013-03-27 14:53:59"
    updated_at "2013-03-27 14:53:59"
  end
end
