require "rails_helper"

describe "Items API" do
  context "GET /api/v1/items/:id/invoice_items" do
    it "returns a collection of associated invoice_items" do
      item = create(:item)
      invoice_items = create_list(:invoice_item, 3, item: item)

      get "/api/v1/items/#{item.id}/invoice_items"

      invoice_items_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(invoice_items_json.count).to eq(3)
      expect(invoice_items_json.first).to have_key(:id)
    end
  end

  context "GET /api/v1/items/:id/merchant" do
    it "returns a collection of associated merchant" do
      merchant = create(:merchant)
      item = create(:item, merchant: merchant)

      get "/api/v1/items/#{item.id}/merchant"

      merchant_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(merchant_json.first).to have_key(:id)
    end
  end
end
