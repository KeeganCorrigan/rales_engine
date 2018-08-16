require 'rails_helper'

describe 'Customers API' do
  context 'GET /api/v1/customers/:id/invoices' do
    it 'returns a collection of associated invoices' do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice_1 = create(:invoice, merchant: merchant, customer: customer)
      invoice_2 = create(:invoice, merchant: merchant, customer: customer)

      get "/api/v1/customers/#{customer.id}/invoices"

      invoices = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to be_successful
      expect(invoices[0][:id]).to eq(invoice_1.id)
      expect(invoices[0][:status]).to eq(invoice_1.status)
      expect(invoices[1][:id]).to eq(invoice_2.id)
      expect(invoices[1][:status]).to eq(invoice_2.status)
    end
  end

  context 'GET /api/v1/customers/:id/transactions' do
    it 'returns a collection of associated transactions' do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice_1 = create(:invoice, merchant: merchant, customer: customer)
      invoice_2 = create(:invoice, merchant: merchant, customer: customer)
      trainsaction_1 = create(:transaction, invoice: invoice_1)
      trainsaction_2 = create(:transaction, invoice: invoice_2)

      get "/api/v1/customers/#{customer.id}/transactions"

      transactions = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to be_successful
      expect(transaction[0][:id]).to eq(transaction_1.id)
      expect(transaction[0][:invoice_id]).to eq(transaction_1.invoice_id)
      expect(transaction[1][:id]).to eq(transaction_2.id)
      expect(transaction[1][:invoice_id]).to eq(transaction_2.invoice_id)
    end
  end
end