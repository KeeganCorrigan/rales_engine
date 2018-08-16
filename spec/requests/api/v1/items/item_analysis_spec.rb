require "rails_helper"

describe "Item API" do
  context "GET /api/v1/items/:id/best_day" do
    it "returns date of best selling day for item" do
      merchant_1 = create(:merchant)

      customer = create(:customer)

      item = Item.create!(name: "VaporLord", description: "Wanna smork?", merchant: merchant_1, unit_price: 5000, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC" )

      invoice_1 = merchant_1.invoices.create!(customer: customer, status: "shipped", created_at: "2012-03-10 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      invoice_2 = merchant_1.invoices.create!(customer: customer, status: "shipped", created_at: "2012-10-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      InvoiceItem.create!(invoice: invoice_1, item: item, unit_price: item.unit_price, quantity: 2, created_at: "2012-03-10 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_2, item: item, unit_price: item.unit_price, quantity: 1, created_at: "2012-10-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      Transaction.create!(invoice: invoice_1, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      Transaction.create!(invoice: invoice_2, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      get "/api/v1/items/#{item.id}/best_day"

      item_json = JSON.parse(response.body)

      expect(response).to be_successful
      expect(item_json).to eq({"best_day" => "2012-03-10T12:54:10.000Z"})
    end
  end

  context "GET /api/v1/items/most_items?quantity=x" do
    it "returns variable number of top items ranked by total number sold" do
      merchant_1 = create(:merchant)

      customer = create(:customer)

      item_1 = Item.create!(name: "VaporLord", description: "Wanna smork?", merchant: merchant_1, unit_price: 5000, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC" )
      item_2 = Item.create!(name: "VaporQueen", description: "Wanna smork?", merchant: merchant_1, unit_price: 5000, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC" )

      invoice_1 = merchant_1.invoices.create!(customer: customer, status: "shipped", created_at: "2012-03-10 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      invoice_2 = merchant_1.invoices.create!(customer: customer, status: "shipped", created_at: "2012-10-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      InvoiceItem.create!(invoice: invoice_1, item: item_1, unit_price: item_1.unit_price, quantity: 2, created_at: "2012-03-10 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_2, item: item_2, unit_price: item_2.unit_price, quantity: 1, created_at: "2012-10-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      Transaction.create!(invoice: invoice_1, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      Transaction.create!(invoice: invoice_2, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      limit = 2

      get "/api/v1/items/most_items?quantity=#{limit}"

      items_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(items_json.count).to eq(2)
      expect(items_json[0][:id]).to eq(item_1.id)
    end
  end
end
