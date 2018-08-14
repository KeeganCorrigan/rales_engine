require "rails_helper"

describe "Merchants API" do
  context "GET /api/v1/merchants/find?parameters" do
    it "returns a merchant based on id param" do
      create_list(:merchant, 3)

      merchant = merchants.first
      name = merchant.name
      id = merchant.id

      get "/api/v1/merchants/find?#{merchant.id}"

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(merchant[:id]).to eq(id)
      expect(merchant[:name]).to eq(name)
    end

    it "returns a merchant based on name param" do

    end

    it "returns a merchant based on created_at param" do


    end

    it "returns a merchant based on updated_at param" do

    end
  end
end
