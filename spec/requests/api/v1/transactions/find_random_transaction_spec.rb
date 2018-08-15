require "rails_helper"

describe "Transactions API" do
  context "GET /api/v1/transactions/random.json" do
    it "returns a random transaction resource" do
      transaction = create_list(:transaction, 3)

      get "/api/v1/transactions/random.json"

      transaction = JSON.parse(response.body, symbolize_names: true)

      expect(transaction).to have_key(:credit_card_number)
      expect(transaction).to have_key(:id)
    end
  end
end
