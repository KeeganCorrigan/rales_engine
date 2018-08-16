require "rails_helper"

describe "Invoices API" do
  context "GET /api/v1/invoices/#{id}/transactions" do
    it "returns a list of transactions associated with invoice" do
      invoices = create_list(:invoice, 3)
      invoice = invoices.first
      invoice.transactions.create!(credit_card_number: "oijioasjd", result: "success", created_at: "2013-03-27 14:53:59", updated_at: "2013-03-27 14:53:59")

      get "/api/v1/invoices/#{invoice.id}/transactions"

      transactions = JSON.parse(response.body, symbolize_names: true)
      transaction = transactions.first

      expect(response).to be_successful
      expect(transactions.count).to eq(1)
      expect(transaction[:invoice_id]).to eq(invoice.id)
      expect(transaction).to have_key(:credit_card_number)
    end

    context "GET /api/v1/invoices/#{id}/invoice_items" do
      it "returns a list of invoice items associated with invoice" do
        invoice = create(:invoice)
        item = create(:item)

        invoice.invoice_items.create!(item: item, quantity: 1, unit_price: 500, created_at: "2018-08-13 18:24:47", updated_at: "2018-08-13 18:24:47" )
        invoice.invoice_items.create!(item: item, quantity: 2, unit_price: 1000, created_at: "2018-08-13 18:24:47", updated_at: "2018-08-13 18:24:47" )

        get "/api/v1/invoices/#{invoice.id}/invoice_items"

        invoice_items = JSON.parse(response.body, symbolize_names: true)
        invoice_item = invoice_items.first

        expect(response).to be_successful
        expect(invoice_items.count).to eq(2)
        expect(invoice_item).to have_key(:unit_price)
      end
    end

    context "GET /api/v1/invoices/#{id}/items" do
      it "returns a list of items associated with invoice" do
        invoice = create(:invoice)
        item = create(:item)

        invoice.invoice_items.create!(item: item, quantity: 1, unit_price: 500, created_at: "2018-08-13 18:24:47", updated_at: "2018-08-13 18:24:47" )
        invoice.invoice_items.create!(item: item, quantity: 2, unit_price: 1000, created_at: "2018-08-13 18:24:47", updated_at: "2018-08-13 18:24:47" )

        get "/api/v1/invoices/#{invoice.id}/items"

        items = JSON.parse(response.body, symbolize_names: true)
        item = items.first

        expect(response).to be_successful
        expect(items.count).to eq(2)
        expect(item).to have_key(:unit_price)
      end
    end

    context "GET /api/v1/invoices/#{id}/customer" do
      it "returns customer associated with invoice" do
        invoice = create(:invoice)

        first_name = invoice.customer.first_name
        last_name = invoice.customer.last_name

        get "/api/v1/invoices/#{invoice.id}/customer"

        customer = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(customer[:first_name]).to eq(first_name)
        expect(customer[:last_name]).to eq(last_name)
        expect(customer).to have_key(:id)
      end
    end

    context "GET /api/v1/invoices/#{id}/merchant" do
      it "returns merchant associated with invoice" do
        invoice = create(:invoice)

        name = invoice.merchant.name

        get "/api/v1/invoices/#{invoice.id}/merchant"

        merchant = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(merchant[:name]).to eq(name)
        expect(merchant).to have_key(:id)
      end
    end
  end
end
