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
  end
end
