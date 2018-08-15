require "rails_helper"

describe "Customers API" do
  context "GET /api/v1/customers/random.json" do
    it "returns a random customer resource" do
      customers = create_list(:customer, 3)

      get "/api/v1/customers/random.json"

      customer = JSON.parse(response.body, symbolize_names: true)

      expect(customer).to have_key(:first_name)
      expect(customer).to have_key(:id)
    end
  end
end
