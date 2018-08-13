require "rails_helper"

describe Merchant, type: :model do
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:created_at)}
  it {should validate_presence_of(:updated_at)}
end
