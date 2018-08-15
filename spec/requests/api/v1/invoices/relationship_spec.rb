require "rails_helper"

describe "Invoices API" do
  context "GET /api/v1/invoices/#{id}/transactions" do
    it "returns a list of transactions associated with invoice" do
      invoice = create(:invoice)

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
