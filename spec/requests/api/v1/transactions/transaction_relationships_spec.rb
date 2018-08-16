require 'rails_helper'

describe 'Transactions API' do
	context 'GET /api/v1/transactions/:id/invoice' do
		it "returns the transaction's invoice" do
			invoice = create(:invoice)
			transaction = create(:transaction, invoice: invoice)

			get "/api/v1/transactions/#{transaction.id}/invoice"

			invoice_json = JSON.parse(response.body, symbolize_names: true)

			expect(response).to be_successful
			expect(invoice_json[:id]).to eq(invoice.id)
			expect(invoice_json[:customer_id]).to eq(invoice.customer_id)
		end
	end
end
