require "rails_helper"

describe "Merchants API" do
  context "GET /api/v1/merchants/find_all?parameters" do
    before :each do
      merchants = create_list(:merchant, 3)
      @merchant = merchants.first
      Merchant.create!(name: "oioijasd", created_at: "2012-03-27 14:53:59", updated_at: "2012-03-27 14:53:59" )
    end

    it "returns merchants based on id param" do

      get "/api/v1/merchants/find_all?id=#{@merchant.id}"

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(merchants[0][:id]).to eq(@merchant.id)
      expect(merchants[0][:name]).to eq(@merchant.name)
    end

    it "returns merchants based on name param" do

      get "/api/v1/merchants/find_all?name=#{@merchant.name}"

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(merchants.length).to eq(3)
      expect(merchants[0][:id]).to eq(@merchant.id)
      expect(merchants[0][:name]).to eq(@merchant.name)
    end

    it "returns merchants based on created_at param" do

      get "/api/v1/merchants/find_all?created_at=#{@merchant.created_at}"

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(merchants.length).to eq(3)
      expect(merchants[0][:id]).to eq(@merchant.id)
      expect(merchants[0][:name]).to eq(@merchant.name)
    end

    it "returns merchants based on updated_at param" do
      get "/api/v1/merchants/find_all?updated_at=#{@merchant.updated_at}"

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(merchants.length).to eq(3)
      expect(merchants[0][:id]).to eq(@merchant.id)
      expect(merchants[0][:name]).to eq(@merchant.name)
    end
  end
end
