FactoryBot.define do
  factory :merchant do
    name "McShannahanigans"
    updated_at { 2.years.ago }
    created_at { 3.years.ago }
  end
end
