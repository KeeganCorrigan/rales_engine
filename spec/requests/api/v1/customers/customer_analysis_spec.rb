require "rails_helper"

describe "Customer API" do
  context "/api/v1/customers/:id/favorite_merchant" do
    it "returns customers favorite merchant" do
      merchant_1 = create(:merchant)
      merchant_2 = Merchant.create!(name: "oijasodij", updated_at: "2012-03-07 12:54:10 UTC", created_at: "2012-03-07 12:54:10 UTC")

      customer = create(:customer)

      item = Item.create!(name: "VaporLord", description: "Wanna smork?", merchant: merchant_1, unit_price: 5000, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC" )

      invoice_1 = merchant_1.invoices.create!(customer: customer, status: "shipped", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      invoice_2 = merchant_1.invoices.create!(customer: customer, status: "shipped", created_at: "2012-10-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      invoice_3 = merchant_2.invoices.create!(customer: customer, status: "shipped", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      InvoiceItem.create!(invoice: invoice_1, item: item, unit_price: item.unit_price, quantity: 2, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_1, item: item, unit_price: item.unit_price, quantity: 1, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_2, item: item, unit_price: item.unit_price, quantity: 1, created_at: "2012-10-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_2, item: item, unit_price: item.unit_price, quantity: 1, created_at: "2012-10-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_3, item: item, unit_price: item.unit_price, quantity: 2, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      Transaction.create!(invoice: invoice_1, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      Transaction.create!(invoice: invoice_2, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      Transaction.create!(invoice: invoice_3, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      get "/api/v1/customers/#{customer.id}/favorite_merchant"

      merchant_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(merchant_json[:id]).to eq(merchant_1[:id])
    end
  end
end
