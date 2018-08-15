require 'rails_helper'

describe 'Inovice Items API' do
  context 'GET /api/v1/invoice_items/find?parameters' do
    it 'returns an invoice_item based on id param' do
      invoice_items = create_list(:invoice_item, 3)

      invoice_item = invoice_items.first
      id = invoice_item.id
      invoice_id = invoice_item.invoice_id
      item_id = invoice_item.item_id
      quantity = invoice_item.quantity

      get "/api/v1/invoice_items/find?id=#{id}"

      invoice_item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(invoice_item[:id]).to eq(id)
      expect(invoice_item[:invoice_id]).to eq(invoice_id)
      expect(invoice_item[:item_id]).to eq(item_id)
      expect(invoice_item[:quantity]).to eq(quantity)
    end
  end
end