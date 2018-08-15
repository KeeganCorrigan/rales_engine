require 'rails_helper' 

describe 'Invoices API' do
	context 'GET /api/v1/invoices/find_all?parameters' do
		before :each do
			invoices = create_list(:invoice, 3)
			@invoice = invoices.first
			Invoice.create!(customer: create(:customer), merchant: create(:merchant), status: "something", created_at: "2019-03-27 14:53:59", updated_at: "2029-03-27 14:53:59")
		end

		it 'returns invoices based on id param' do
			get "/api/v1/invoices/find_all?id=#{@invoice.id}"
		
			invoices = JSON.parse(response.body, symbolize_names: true)

			expect(response).to be_successful
			expect(invoices[0][:id]).to eq(@invoice.id)
			expect(invoices[0][:status]).to eq(@invoice.status)
		end

		it 'returns invoices based on customer_id param' do
			get "/api/v1/invoices/find_all?customer_id=#{@invoice.customer_id}"
		
			invoices = JSON.parse(response.body, symbolize_names: true)

			expect(response).to be_successful
			expect(invoices[0][:id]).to eq(@invoice.id)
			expect(invoices[0][:status]).to eq(@invoice.status)
		end

		it 'returns invoices based on merchant_id param' do
			get "/api/v1/invoices/find_all?merchant_id=#{@invoice.merchant_id}"
		
			invoices = JSON.parse(response.body, symbolize_names: true)

			expect(response).to be_successful
			expect(invoices[0][:id]).to eq(@invoice.id)
			expect(invoices[0][:status]).to eq(@invoice.status)
		end

		it 'returns invoices based on status param' do
			get "/api/v1/invoices/find_all?status=#{@invoice.status}"
		
			invoices = JSON.parse(response.body, symbolize_names: true)

			expect(response).to be_successful
			expect(invoices[0][:id]).to eq(@invoice.id)
			expect(invoices[0][:status]).to eq(@invoice.status)
		end

		it 'returns invoices based on created_at param' do
			get "/api/v1/invoices/find_all?created_at=#{@invoice.created_at}"
		
			invoices = JSON.parse(response.body, symbolize_names: true)

			expect(response).to be_successful
			expect(invoices[0][:id]).to eq(@invoice.id)
			expect(invoices[0][:status]).to eq(@invoice.status)
		end

		it 'returns invoices based on updated_at param' do
			get "/api/v1/invoices/find_all?updated_at=#{@invoice.updated_at}"
		
			invoices = JSON.parse(response.body, symbolize_names: true)

			expect(response).to be_successful
			expect(invoices[0][:id]).to eq(@invoice.id)
			expect(invoices[0][:status]).to eq(@invoice.status)
		end
	end
end