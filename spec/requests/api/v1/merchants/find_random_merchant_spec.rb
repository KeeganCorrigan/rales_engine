require "rails_helper"

describe "Merchants API" do
  context "GET /api/v1/merchants/random.json" do
    it "returns a random merchant resource" do
      merchants = create_list(:merchant, 3)

      get "/api/v1/merchants/random.json"

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(merchant).to have_key(:name)
      expect(merchant).to have_key(:id)
    end
  end
end
