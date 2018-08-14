require 'rails_helper'

describe 'invoice items API' do
  context 'GET /api/v1/invoice_items' do
    it 'returns a list of invoice items' do
      get '/api/v1/invoice_items'

      expect(response).to be_successful
      expect(invoice_items.count).to eq(3)
      expect(invoice_itme).to have_key(:item_id)
      expect(invoice_itme).to have_key(:invoice_id)
      expect(invoice_itme).to have_key(:quantity)
      expect(invoice_itme).to have_key(:unit_price)
    end
  end
end