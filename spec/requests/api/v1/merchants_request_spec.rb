require "rails_helper"

describe "Merchant API" do
  context "GET /api/v1/merchants" do
    it "returns all merchants" do
      create_list(:merchant, 3)

      get "/api/v1/merchants"

      expect(response).to be_successful

      merchants = JSON.parse(response.body, symbolize_names: true)
      merchant = merchants.first

      expect(merchants.count).to eq(3)
      expect(merchant).to have_key(:name)
    end
  end

  context "GET /api/v1/merchants/#{id}" do
    it "can return merchant based on id" do
      id = create(:merchant).id

      get "/api/v1/merchants/#{id}"

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(merchant[:id]).to eq(id)
    end
  end
end
