require "rails_helper"

describe "Customers API" do
  context "GET /api/v1/customers/find?parameters" do
    it "returns a customer based on id param" do
      customers = create_list(:customer, 3)

      customer = customers.first
      first_name = customer.first_name
      id = customer.id

      get "/api/v1/customers/find?id=#{customer.id}"

      customer = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(customer[:id]).to eq(id)
      expect(customer[:first_name]).to eq(first_name)
    end

    it "returns a customer based on first name param" do
      customers = create_list(:customer, 3)

      customer = customers.first
      first_name = customer.first_name
      id = customer.id

      get "/api/v1/customers/find?first_name=#{customer.first_name}"

      customer = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(customer[:id]).to eq(id)
      expect(customer[:first_name]).to eq(first_name)
    end


  end
end
