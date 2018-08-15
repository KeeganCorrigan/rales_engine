require 'rails_helper'

describe 'Invoices API' do
  context 'GET /api/v1/invoices/find?parameters' do
    it 'returns an invoice based on id param' do
      invoices = create_list(:invoice, 3)

      invoice = invoices.first
      id = invoice.id
      customer_id = invoice.customer_id
      merchant_id = invoice.merchant_id
      status = invoice.status

      get "/api/v1/invoices/find?id=#{id}"

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(invoice[:id]).to eq(id)
      expect(invoice[:customer_id]).to eq(customer_id)
      expect(invoice[:merchant_id]).to eq(merchant_id)
      expect(invoice[:status]).to eq(status)
    end
    it 'returns an invoice based on customer_id param' do
      invoices = create_list(:invoice, 3)

      invoice = invoices.first
      id = invoice.id
      customer_id = invoice.customer_id
      merchant_id = invoice.merchant_id
      status = invoice.status

      get "/api/v1/invoices/find?customer_id=#{customer_id}"

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(invoice[:id]).to eq(id)
      expect(invoice[:customer_id]).to eq(customer_id)
      expect(invoice[:merchant_id]).to eq(merchant_id)
      expect(invoice[:status]).to eq(status)
    end

    it 'returns an invoice based on merchant_id param' do
      invoices = create_list(:invoice, 3)

      invoice = invoices.first
      id = invoice.id
      customer_id = invoice.customer_id
      merchant_id = invoice.merchant_id
      status = invoice.status

      get "/api/v1/invoices/find?merchant_id=#{merchant_id}"

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(invoice[:id]).to eq(id)
      expect(invoice[:customer_id]).to eq(customer_id)
      expect(invoice[:merchant_id]).to eq(merchant_id)
      expect(invoice[:status]).to eq(status)
    end

    it 'returns an invoice based on status param' do
      invoices = create_list(:invoice, 3)

      invoice = invoices.first
      id = invoice.id
      customer_id = invoice.customer_id
      merchant_id = invoice.merchant_id
      status = invoice.status

      get "/api/v1/invoices/find?status=#{status}"

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(invoice[:id]).to eq(id)
      expect(invoice[:customer_id]).to eq(customer_id)
      expect(invoice[:merchant_id]).to eq(merchant_id)
      expect(invoice[:status]).to eq(status)
    end

    it 'returns an invoice based on updated_at param' do
      invoices = create_list(:invoice, 3)

      invoice = invoices.first
      id = invoice.id
      customer_id = invoice.customer_id
      merchant_id = invoice.merchant_id
      status = invoice.status

      get "/api/v1/invoices/find?updated_at=#{invoice.updated_at}"

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(invoice[:id]).to eq(id)
      expect(invoice[:customer_id]).to eq(customer_id)
      expect(invoice[:merchant_id]).to eq(merchant_id)
      expect(invoice[:status]).to eq(status)
    end

    it 'returns an invoice based on created_at param' do
      invoices = create_list(:invoice, 3)

      invoice = invoices.first
      id = invoice.id
      customer_id = invoice.customer_id
      merchant_id = invoice.merchant_id
      status = invoice.status

      get "/api/v1/invoices/find?created_at=#{invoice.created_at}"

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(invoice[:id]).to eq(id)
      expect(invoice[:customer_id]).to eq(customer_id)
      expect(invoice[:merchant_id]).to eq(merchant_id)
      expect(invoice[:status]).to eq(status)
    end
  end
end