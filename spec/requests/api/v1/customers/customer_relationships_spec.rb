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
end