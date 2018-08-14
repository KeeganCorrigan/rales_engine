require 'rails_helper'

describe 'Merchants API' do
  context 'GET /api/v1/merchants/:id/revenue' do
    xit 'will display total revenue for a single merchant' do
      merchant = create(:merchant)
      customer = create(:customer)
      item = Item.create!(name: "VaporLord", description: "Wanna smork?", merchant: merchant, unit_price: 5000, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC" )
      invoice_1 = merchant.invoices.create!(merchant: merchant, customer: customer, status: "shipped", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      invoice_2 = merchant.invoices.create!(merchant: merchant, customer: customer, status: "shipped", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      invoice_3 = merchant.invoices.create!(merchant: merchant, customer: customer, status: "shipped", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_1, item: item, unit_price: item.unit_price, quantity: 2, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_1, item: item, unit_price: item.unit_price, quantity: 1, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_2, item: item, unit_price: item.unit_price, quantity: 1, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_2, item: item, unit_price: item.unit_price, quantity: 1, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_3, item: item, unit_price: item.unit_price, quantity: 2, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      Transaction.create!(invoice: invoice_1, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      Transaction.create!(invoice: invoice_2, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      Transaction.create!(invoice: invoice_3, credit_card_number: 9876, credit_card_expiration_date: " ", result: "failed", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      
      get "/api/v1/merchants/#{merchant.id}/revenue"

      revenue = JSON.parse(response.body)
      expect(response).to be_successful
      expect(revenue).to eq({"revenue" => "250.00"})
    end
  end
end