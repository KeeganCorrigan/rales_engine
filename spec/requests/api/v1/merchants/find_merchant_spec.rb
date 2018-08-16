require "rails_helper"

describe "Merchants API" do
  context "GET /api/v1/merchants/find?parameters" do
    it "returns a merchant based on id param" do
      merchants = create_list(:merchant, 3)

      merchant = merchants.first
      name = merchant.name
      id = merchant.id

      get "/api/v1/merchants/find?id=#{merchant.id}"

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(merchant[:id]).to eq(id)
      expect(merchant[:name]).to eq(name)
    end

    it "returns a merchant based on name param" do
      merchants = create_list(:merchant, 3)

      merchant = merchants.first
      name = merchant.name
      id = merchant.id

      get "/api/v1/merchants/find?name=#{merchant.name}"

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(merchant[:id]).to eq(id)
      expect(merchant[:name]).to eq(name)
    end

    it "returns a merchant based on created_at param" do
      merchant = Merchant.create!(name: "John's big ol shop", created_at: "2012-03-27 14:53:59", updated_at: "2012-03-27 14:53:59")

      name = merchant.name
      id = merchant.id

      get "/api/v1/merchants/find?created_at=#{merchant.created_at}"

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(merchant[:id]).to eq(id)
      expect(merchant[:name]).to eq(name)
    end

    it "returns a merchant based on updated_at param" do
      merchant = Merchant.create!(name: "John's big ol shop", created_at: "2012-03-27 14:53:59", updated_at: "2012-03-27 14:53:59")

      name = merchant.name
      id = merchant.id

      get "/api/v1/merchants/find?created_at=#{merchant.updated_at}"

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(merchant[:id]).to eq(id)
      expect(merchant[:name]).to eq(name)
    end
  end
end
