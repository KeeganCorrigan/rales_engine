require "rails_helper"

describe "Transactions API" do
  context "GET /api/v1/transactions/find_all?parameters" do
    before :each do
      transactions = create_list(:transaction, 3)
      invoice = create(:invoice)
      @transaction = transactions.first

      Transaction.create!(credit_card_number: "1234", invoice: invoice, result: "failed", created_at: "2012-03-27 14:53:59", updated_at: "2012-03-27 14:53:59")
    end

    it "returns transactions based on id param" do
      get "/api/v1/transactions/find_all?id=#{@transaction.id}"

      transactions = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(transactions[0][:id]).to eq(@transaction.id)
      expect(transactions[0][:credit_card_number]).to eq(@transaction.credit_card_number)
    end

    it "returns transactions based on credit card number param" do
      get "/api/v1/transactions/find_all?credit_card_number=#{@transaction.credit_card_number}"

      transactions = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(transactions.length).to eq(3)
      expect(transactions[0][:id]).to eq(@transaction.id)
      expect(transactions[0][:credit_card_number]).to eq(@transaction.credit_card_number)
    end

    it "returns transactions based on credit card number param" do
      get "/api/v1/transactions/find_all?result=#{@transaction.result}"

      transactions = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(transactions.length).to eq(3)
      expect(transactions[0][:id]).to eq(@transaction.id)
      expect(transactions[0][:credit_card_number]).to eq(@transaction.credit_card_number)
    end

    it "returns transactions based on updated at param" do
      get "/api/v1/transactions/find_all?updated_at=#{@transaction.updated_at}"

      transactions = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(transactions.length).to eq(3)
      expect(transactions[0][:id]).to eq(@transaction.id)
      expect(transactions[0][:credit_card_number]).to eq(@transaction.credit_card_number)
    end

    it "returns transactions based on created at param" do
      get "/api/v1/transactions/find_all?created_at=#{@transaction.created_at}"

      transactions = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(transactions.length).to eq(3)
      expect(transactions[0][:id]).to eq(@transaction.id)
      expect(transactions[0][:credit_card_number]).to eq(@transaction.credit_card_number)
    end
  end
end
