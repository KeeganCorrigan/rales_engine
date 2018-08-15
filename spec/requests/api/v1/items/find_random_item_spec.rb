require "rails_helper"

describe "Items API" do
  context "GET /api/v1/items/random.json" do
    it "returns a random invoice resource" do
      items = create_list(:item, 3)

      get "/api/v1/items/random.json"

      item = JSON.parse(response.body, symbolize_names: true)

      expect(item).to have_key(:name)
      expect(item).to have_key(:description)
    end
  end
end