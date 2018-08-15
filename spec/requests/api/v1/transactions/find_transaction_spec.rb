require "rails_helper"

describe "Transactions API" do
  context "GET /api/v1/transactions/find?parameters" do
    it "returns a transaction based on id param" do
      transactions = create_list(:transaction, 3)

      transaction = transactions.first
      id = transaction.id
      result = transaction.result
      credit_card_number = transaction.credit_card_number

      get "/api/v1/transactions/find?id=#{transaction.id}"

      transaction = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(transaction[:id]).to eq(id)
      expect(transaction[:result]).to eq(result)
      expect(transaction[:credit_card_number]).to eq(credit_card_number)
    end
  end
end
