require "rails_helper"

describe "Transaction API" do
  context "GET /api/v1/transactions" do
    it "returns all transactions" do
      create_list(:transaction, 3)

      get "/api/v1/transactions"

      expect(response).to be_successful

      transactions = JSON.parse(response.body, symbolize_names: true)
      transaction = transactions.first

      expect(transactions.count).to eq(3)
      expect(transaction).to have_key(:name)
    end
  end

  context "GET /api/v1/transactions/#{id}" do
    it "can return transaction based on id" do
      id = create(:transaction).id

      get "/api/v1/transactions/#{id}"

      transaction = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(transaction[:id]).to eq(id)
    end
  end
end
