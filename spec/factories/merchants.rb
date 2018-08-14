FactoryBot.define do
  factory :merchant do
    name "MyString"
    updated_at { 2.years.ago }
    created_at { 3.years.ago }
  end
end
