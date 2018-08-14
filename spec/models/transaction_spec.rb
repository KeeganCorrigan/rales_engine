require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'validations' do
    it { should validate_presence_of(:credit_card_number) }
    it { should validate_presence_of(:result) }
    it { should validate_presence_of(:created_at) }
    it { should validate_presence_of(:updated_at) }
  end

  context 'relationships' do
    it { should belong_to(:invoice) }
  end
end
