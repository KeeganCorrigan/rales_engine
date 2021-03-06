require 'rails_helper'

describe 'items API' do
  context 'GET /api/v1/items' do
    it 'returns a list of all items' do
      create_list(:item, 3)

      get '/api/v1/items'

      items = JSON.parse(response.body, symbolize_names: true)
      item = items.first

      expect(response).to be_successful
      expect(items.count).to eq(3)
      expect(item).to have_key(:name)
      expect(item).to have_key(:unit_price)
      expect(item).to have_key(:merchant_id)
    end
  end

  context "GET /api/v1/items/#{id}" do
    it 'can return item based on id' do
      id = create(:item).id

      get "/api/v1/items/#{id}"

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(item[:id]).to eq(id)
    end
  end
end