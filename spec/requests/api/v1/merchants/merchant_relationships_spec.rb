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

  context 'GET /api/v1/merchants/:id/invoices'
end