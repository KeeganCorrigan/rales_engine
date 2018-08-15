require "rails_helper"

describe "Customers API" do
  context "GET /api/v1/customers/find_all?parameters" do
    before :each do
      customers = create_list(:customer, 3)
      @customer = customers.first
      Customer.create!(first_name: "jj09j", last_name: "ija09sjd", created_at: "2012-03-27 14:53:59", updated_at: "2012-03-27 14:53:59")
    end

    it "returns customers based on id param" do
      get "/api/v1/customers/find_all?id=#{@customer.id}"

      customers = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(customers[0][:id]).to eq(@customer.id)
      expect(customers[0][:first_name]).to eq(@customer.first_name)
    end

    it "returns customers based on first name param" do
      get "/api/v1/customers/find_all?first_name=#{@customer.first_name}"

      customers = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(customers.length).to eq(3)
      expect(customers[0][:id]).to eq(@customer.id)
      expect(customers[0][:first_name]).to eq(@customer.first_name)
    end
  end
end
