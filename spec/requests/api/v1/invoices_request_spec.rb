require 'rails_helper'

describe 'invoices API' do
  context 'GET /api/v1/invoices' do
    it 'returns a list of invoices' do

      get '/api/v1/invoices'

      expect(response).to be_successful
      expect(invoices.count).to eq(3)
      expect(item).to have_key(:customer_id)
      expect(item).to have_key(:merchant_id)
      expect(item).to have_key(:status)
    end
  end
end