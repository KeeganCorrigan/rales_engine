require "rails_helper"

describe 'customers API' do
  context 'GET /api/v1/customers' do
    it 'returns a list of customers' do
      create_list(:customer, 3)

      get '/api/v1/customers'


      customers = JSON.parse(response.body, symbolize_names: true)
      customer = customers.first

      expect(response).to be_successful
      expect(customers.count).to eq(3)
      expect(customer).to have_key(:first_name)
      expect(customer).to have_key(:last_name)
      expect(customer).to_not have_key(:created_at)
      expect(customer).to_not have_key(:updated_at)
    end
  end

  context 'GET /api/v1/customers/#{id}' do
    it 'can return customer based on id' do
      id = create(:customer).id

      get "/api/v1/customers/#{id}"

      customer = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(customer[:id]).to eq(id)
    end
  end
end
