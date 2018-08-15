require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:merchant_id) }
    it { should validate_presence_of(:unit_price) }
    it { should validate_presence_of(:created_at) }
    it { should validate_presence_of(:updated_at) }
  end

  context 'relationships' do
    it { should belong_to(:merchant) }
    it { should have_many(:invoices).through(:invoice_items)}
  end

  describe 'instance methods' do
    it '.most_sold_by_day' do
      merchant_1 = create(:merchant)

      customer = create(:customer)

      item = Item.create!(name: "VaporLord", description: "Wanna smork?", merchant: merchant_1, unit_price: 5000, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC" )

      invoice_1 = merchant_1.invoices.create!(customer: customer, status: "shipped", created_at: "2012-03-10 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      invoice_2 = merchant_1.invoices.create!(customer: customer, status: "shipped", created_at: "2012-10-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      InvoiceItem.create!(invoice: invoice_1, item: item, unit_price: item.unit_price, quantity: 2, created_at: "2012-03-10 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_2, item: item, unit_price: item.unit_price, quantity: 1, created_at: "2012-10-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      Transaction.create!(invoice: invoice_1, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      Transaction.create!(invoice: invoice_2, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      expect(item.most_sold_by_day).to eq(invoice_1.created_at)
    end
  end
end
