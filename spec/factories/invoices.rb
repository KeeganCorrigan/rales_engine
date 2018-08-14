FactoryBot.define do
  factory :invoice do
    customer {create(:customer)}
    merchant {create(:merchant)}
    status "MyString"
    created_at { 3.years.ago}
    updated_at { 2.years.ago}
  end
end
