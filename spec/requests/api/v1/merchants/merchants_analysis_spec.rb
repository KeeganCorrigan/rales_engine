require 'rails_helper'

describe 'Merchants API' do
  context 'GET /api/v1/merchants/:id/revenue' do
    it 'will display total revenue for a single merchant' do
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
      expect(revenue).to eq( {"revenue" => "250.00"} )
    end
  end

  context 'GET /api/v1/merchants/:id/revenue?date=#{}' do
    it "will return merchant revenue on a date" do
      merchant = create(:merchant)

      customer = create(:customer)

      item = Item.create!(name: "VaporLord", description: "Wanna smork?", merchant: merchant, unit_price: 5000, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC" )

      invoice_1 = merchant.invoices.create!(merchant: merchant, customer: customer, status: "shipped", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      invoice_2 = merchant.invoices.create!(merchant: merchant, customer: customer, status: "shipped", created_at: "2012-10-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      invoice_3 = merchant.invoices.create!(merchant: merchant, customer: customer, status: "shipped", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      InvoiceItem.create!(invoice: invoice_1, item: item, unit_price: item.unit_price, quantity: 2, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_1, item: item, unit_price: item.unit_price, quantity: 1, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_2, item: item, unit_price: item.unit_price, quantity: 1, created_at: "2012-10-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_2, item: item, unit_price: item.unit_price, quantity: 1, created_at: "2012-10-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_3, item: item, unit_price: item.unit_price, quantity: 2, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      Transaction.create!(invoice: invoice_1, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      Transaction.create!(invoice: invoice_2, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      Transaction.create!(invoice: invoice_3, credit_card_number: 9876, credit_card_expiration_date: " ", result: "failed", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      get "/api/v1/merchants/#{merchant.id}/revenue?date=2012-03-07"

      revenue = JSON.parse(response.body)
      expect(response).to be_successful
      expect(revenue).to eq({"revenue" => "150.00"})
    end
  end

  context 'GET /api/v1/merchants/:id/favorite_customer' do
    it 'returns the favorite customer associated with one merchant' do
      merchant_1 = create(:merchant)

      customer_1 = create(:customer)
      customer_2 = create(:customer)

      item = create(:item)

      invoice_1 = merchant_1.invoices.create!(customer: customer_1, status: "shipped", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      invoice_2 = merchant_1.invoices.create!(customer: customer_1, status: "shipped", created_at: "2012-10-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      invoice_3 = merchant_1.invoices.create!(customer: customer_2, status: "shipped", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      InvoiceItem.create!(invoice: invoice_1, item: item, unit_price: item.unit_price, quantity: 2, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_1, item: item, unit_price: item.unit_price, quantity: 1, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_2, item: item, unit_price: item.unit_price, quantity: 1, created_at: "2012-10-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_2, item: item, unit_price: item.unit_price, quantity: 1, created_at: "2012-10-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_3, item: item, unit_price: item.unit_price, quantity: 2, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      Transaction.create!(invoice: invoice_1, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      Transaction.create!(invoice: invoice_2, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      Transaction.create!(invoice: invoice_3, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      get "/api/v1/merchants/#{merchant_1.id}/favorite_customer"

      favorite_customer = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(favorite_customer[:id]).to eq(customer_1.id)
      expect(favorite_customer[:first_name]).to eq(customer_1.first_name)
    end
  end

  context 'GET /api/v1/merchants/revenue?date=x' do
    it 'returns the revunue for all merchants by date' do
      merchant_1 = create(:merchant)
      merchant_2 = create(:merchant)

      customer = create(:customer)

      item = Item.create!(name: "VaporLord", description: "Wanna smork?", merchant: merchant_1, unit_price: 5000, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC" )

      invoice_1 = merchant_1.invoices.create!(customer: customer, status: "shipped", created_at: "2012-03-10 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      invoice_2 = merchant_2.invoices.create!(customer: customer, status: "shipped", created_at: "2012-03-10 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      invoice_3 = merchant_2.invoices.create!(customer: customer, status: "shipped", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      InvoiceItem.create!(invoice: invoice_1, item: item, unit_price: item.unit_price, quantity: 2, created_at: "2012-03-10 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_2, item: item, unit_price: item.unit_price, quantity: 1, created_at: "2012-03-10 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_3, item: item, unit_price: item.unit_price, quantity: 1, created_at: "2012-03-10 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      Transaction.create!(invoice: invoice_1, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-10 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      Transaction.create!(invoice: invoice_2, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-10 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      Transaction.create!(invoice: invoice_3, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-10 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      desired_date = '2012-03-10'
      get "/api/v1/merchants/revenue?date=#{desired_date}"

      total_revenue = JSON.parse(response.body)

      expect(response).to be_successful
      expect(total_revenue).to eq("total_revenue" => "150.00")
    end
  end

  context 'GET /api/v1/merchants/most_items?quantity=#{}' do
    it "will return merchant revenue on a date" do
      merchant_1 = create(:merchant)
      merchant_2 = create(:merchant)
      item = create(:item)

      customer = create(:customer)

      invoice_1 = merchant_1.invoices.create!(customer: customer, status: "shipped", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      invoice_2 = merchant_2.invoices.create!(customer: customer, status: "shipped", created_at: "2012-10-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      InvoiceItem.create!(invoice: invoice_1, item: item, unit_price: item.unit_price, quantity: 2, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_2, item: item, unit_price: item.unit_price, quantity: 1, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      Transaction.create!(invoice: invoice_1, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      Transaction.create!(invoice: invoice_2, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      most_sold = 2

      get "/api/v1/merchants/most_items?quantity=#{most_sold}"

      top_merchants = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(top_merchants).to eq([{:id=>1, :name=>"McShannahanigans"}, {:id=>2, :name=>"McShannahanigans"}])

      most_sold = 1

      get "/api/v1/merchants/most_items?quantity=#{most_sold}"

      top_merchants = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(top_merchants).to eq([{:id=>1, :name=>"McShannahanigans"}])
    end
  end
  context "GET /api/v1/merchants/most_revenue?quantity=x" do
    it "returns a collection of merchants by total revenue" do

      merchant_1 = create(:merchant)
      merchant_2 = create(:merchant)

      customer = create(:customer)

      item = Item.create!(name: "VaporLord", description: "Wanna smork?", merchant: merchant_1, unit_price: 5000, created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC" )

      invoice_1 = merchant_1.invoices.create!(customer: customer, status: "shipped", created_at: "2012-03-10 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      invoice_2 = merchant_2.invoices.create!(customer: customer, status: "shipped", created_at: "2012-03-10 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      invoice_3 = merchant_2.invoices.create!(customer: customer, status: "shipped", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      InvoiceItem.create!(invoice: invoice_1, item: item, unit_price: item.unit_price, quantity: 2, created_at: "2012-03-10 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_2, item: item, unit_price: item.unit_price, quantity: 1, created_at: "2012-03-10 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      InvoiceItem.create!(invoice: invoice_3, item: item, unit_price: item.unit_price, quantity: 1, created_at: "2012-03-10 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      Transaction.create!(invoice: invoice_1, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-10 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      Transaction.create!(invoice: invoice_2, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-10 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      Transaction.create!(invoice: invoice_3, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-10 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      limit = 2

      get "/api/v1/merchants/most_revenue?quantity=#{limit}"

      merchants_json = JSON.parse(response.body, symbolize_names: true)
      merchant = merchants_json.first

      expect(response).to be_successful
      expect(merchants_json.length).to eq(2)
      expect(merchant[:id]).to eq(merchant_1.id)
    end
  end

  context "/api/v1/merchants/:id/customers_with_pending_invoices" do
    it "returns customers favorite merchant" do
      merchant_1 = create(:merchant)

      customer_1 = create(:customer)
      customer_2 = create(:customer)
      customer_3 = create(:customer)

      invoice_1 = merchant_1.invoices.create!(customer: customer_1, status: "shipped", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      invoice_2 = merchant_1.invoices.create!(customer: customer_2, status: "shipped", created_at: "2012-10-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      invoice_3 = merchant_1.invoices.create!(customer: customer_3, status: "shipped", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      Transaction.create!(invoice: invoice_1, credit_card_number: 9876, credit_card_expiration_date: " ", result: "success", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      Transaction.create!(invoice: invoice_2, credit_card_number: 9876, credit_card_expiration_date: " ", result: "failed", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")
      Transaction.create!(invoice: invoice_3, credit_card_number: 9876, credit_card_expiration_date: " ", result: "failed", created_at: "2012-03-07 12:54:10 UTC", updated_at: "2012-03-07 12:54:10 UTC")

      get "/api/v1/merchants/#{merchant_1.id}/customers_with_pending_invoices"

      customers_json = JSON.parse(response.body, symbolize_names: true)
      customer = customers_json.first

      expect(response).to be_successful
      expect(customers_json.length).to eq(2)
      expect(customer[:id]).to eq(customer_3.id)
    end
  end
end
