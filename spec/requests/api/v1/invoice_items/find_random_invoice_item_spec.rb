require 'rails_helper'

describe 'Invoice Items APT' do
  context 'GET /api/v1/invoice_items/random.json' do
    it 'returns a random invoice items resource' do
      invoice_items = create_list(:invoice_item, 3)

      get '/api/v1/invoice_items/random.json'

      invoice_item = JSON.parse(response.body, symbolize_names: true)

      expect(invoice_item).to have_key(:unit_price)
      expect(invoice_item).to have_key(:quantity)
      expect(invoice_item).to have_key(:item_id)
    end
  end
end