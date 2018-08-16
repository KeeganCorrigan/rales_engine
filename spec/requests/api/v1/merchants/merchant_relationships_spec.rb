require 'rails_helper'

describe 'Merchants API' do
  context 'GET /api/v1/merchants/:id/items' do
    it 'returns all associated items for merchant' do
      merchant = create(:merchant)
      item_1 = create(:item, merchant: merchant)
      item_2 = create(:item, merchant: merchant)

      get "/api/v1/merchants/#{merchant.id}/items"

      items = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(items[0][:id]).to eq(item_1.id)
      expect(items[0][:name]).to eq(item_1.name)
      expect(items[1][:id]).to eq(item_2.id)
      expect(items[1][:name]).to eq(item_2.name)
    end
  end
  
  context 'GET /api/v1/merchants/:id/invoices' do
    it 'returns all associated invoices for merchant' do
      merchant = create(:merchant)
      invoice_1 = create(:invoice, merchant: merchant, customer: create(:customer))
      invoice_2 = create(:invoice, merchant: merchant, customer: create(:customer))
      
      get "/api/v1/merchants/#{merchant.id}/invoices"
      
      invoices = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to be_successful
      expect(invoices[0][:id]).to eq(invoice_1.id)
      expect(invoices[0][:status]).to eq(invoice_1.status)
      expect(invoices[1][:id]).to eq(invoice_2.id)
      expect(invoices[1][:status]).to eq(invoice_2.status)
    end
  end
end