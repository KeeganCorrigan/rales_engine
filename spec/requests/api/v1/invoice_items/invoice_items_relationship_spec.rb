require "rails_helper"

describe "Invoice Items API" do
  context "GET /api/v1/invoice_items/:id/invoice" do
    it "returns invoice associated with invoice item" do
      invoice_item = create(:invoice_item)
      invoice_id = invoice_item.invoice.id

      get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(invoice[:id]).to eq(invoice_id)
    end
  end

  context "GET /api/v1/invoice_items/:id/item" do
    it "returns item associated with invoice item" do
      invoice_item = create(:invoice_item)
      item_id = invoice_item.item.id

      get "/api/v1/invoice_items/#{invoice_item.id}/item"

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(item[:id]).to eq(item_id)
    end
  end
end
