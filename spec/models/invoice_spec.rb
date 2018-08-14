require 'rails_helper'

RSpec.describe Invoice, type: :model do
  context 'validations' do
    it { should validate_presence_of(:customer_id) }
    it { should validate_presence_of(:merchant_id) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:created_at) }
    it { should validate_presence_of(:updated_at) }
  end

  context 'relationships' do
    it { should belong_to(:customer) } 
    it { should belong_to(:merchant) } 
  end
end
