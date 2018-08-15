FactoryBot.define do
  factory :invoice do
    customer {create(:customer)}
    merchant {create(:merchant)}
    status "MyString"
    created_at "2013-03-27 14:53:59"
    updated_at "2013-03-27 14:53:59"
  end
end
