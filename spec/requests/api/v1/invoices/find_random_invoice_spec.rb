require "rails_helper"

describe 'Invoices API' do
  context 'GET /api/v1/invoices/random.json' do
    it 'returns a random invoice resource' do
      invoices = create_list(:invoice, 3)

      get '/api/v1/invoices/random.json'

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(invoice).to have_key(:status)
      expect(invoice).to have_key(:id)
    end
  end
end