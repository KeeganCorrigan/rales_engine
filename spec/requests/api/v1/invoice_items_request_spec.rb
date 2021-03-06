require 'rails_helper'

describe 'invoice items API' do
  context 'GET /api/v1/invoice_items' do
    it 'returns a list of invoice items' do
      create_list(:invoice_item, 3)

      get '/api/v1/invoice_items'

      invoice_items = JSON.parse(response.body, symbolize_names: true)
      invoice_item = invoice_items.first

      expect(response).to be_successful
      expect(invoice_items.count).to eq(3)
      expect(invoice_item).to have_key(:item_id)
      expect(invoice_item).to have_key(:invoice_id)
      expect(invoice_item).to have_key(:quantity)
      expect(invoice_item).to have_key(:unit_price)
    end
  end

  context "GET /api/v1/invoice_items/#{id}" do
    it 'can return invoice item based on id' do
      id = create(:invoice_item).id

      get "/api/v1/invoice_items/#{id}"

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(item[:id]).to eq(id)
    end
  end
end