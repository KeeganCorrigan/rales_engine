FactoryBot.define do
  factory :invoice do
    customer nil
    merchant nil
    status "MyString"
    created_at { 3.years.ago}
    updated_at { 2.years.ago}
  end
end
