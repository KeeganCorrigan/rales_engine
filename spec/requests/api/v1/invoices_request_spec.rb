require 'rails_helper'

describe 'invoices API' do
  context 'GET /api/v1/invoices' do
    it 'returns a list of invoices' do
      create_list(:invoice, 3)

      get '/api/v1/invoices'

      invoices = JSON.parse(response.body, symbolize_names: true)
      invoice = invoices.first

      expect(response).to be_successful
      expect(invoices.count).to eq(3)
      expect(invoice).to have_key(:customer_id)
      expect(invoice).to have_key(:merchant_id)
      expect(invoice).to have_key(:status)
    end
  end

  context "GET /api/v1/invoices/#{id}" do
    it 'can return invoice based on id' do
      id = create(:invoice).id

      get "/api/v1/invoices/#{id}"

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(respons).to be_successful
      expect(invoice[:id]).to eq(id)
    end
  end
end