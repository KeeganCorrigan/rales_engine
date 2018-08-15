require 'rails_helper'

describe 'Items API' do
  context 'GET /api/v1/items/find?parameters' do
    it 'returns an item based on id param' do
      items = create_list(:item, 3)

      item = items.first
      id = item.id
      name = item.name
      unit_price = item.unit_price
      description = item.description
      merchant_id = item.merchant_id

      get "/api/v1/items/find?id=#{id}"

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(item[:id]).to eq(id)
      expect(item[:name]).to eq(name)
      expect(item[:description]).to eq(description)
      expect(item[:merchant_id]).to eq(merchant_id)
      expect(item[:unit_price]).to eq(unit_price)
    end

    it 'returns an item based on name param' do
      items = create_list(:item, 3)

      item = items.first
      id = item.id
      name = item.name
      unit_price = item.unit_price
      description = item.description
      merchant_id = item.merchant_id

      get "/api/v1/items/find?name=#{name}"

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(item[:id]).to eq(id)
      expect(item[:name]).to eq(name)
      expect(item[:description]).to eq(description)
      expect(item[:merchant_id]).to eq(merchant_id)
      expect(item[:unit_price]).to eq(unit_price)
    end

    it 'returns an item based on description param' do
      items = create_list(:item, 3)

      item = items.first
      id = item.id
      name = item.name
      unit_price = item.unit_price
      description = item.description
      merchant_id = item.merchant_id

      get "/api/v1/items/find?description=#{description}"

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(item[:id]).to eq(id)
      expect(item[:name]).to eq(name)
      expect(item[:description]).to eq(description)
      expect(item[:merchant_id]).to eq(merchant_id)
      expect(item[:unit_price]).to eq(unit_price)
    end

    it 'returns an item based on merchant_id param' do
      items = create_list(:item, 3)

      item = items.first
      id = item.id
      name = item.name
      unit_price = item.unit_price
      description = item.description
      merchant_id = item.merchant_id

      get "/api/v1/items/find?merchant_id=#{merchant_id}"

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(item[:id]).to eq(id)
      expect(item[:name]).to eq(name)
      expect(item[:description]).to eq(description)
      expect(item[:merchant_id]).to eq(merchant_id)
      expect(item[:unit_price]).to eq(unit_price)
    end

    it 'returns an item based on unit_price param' do
      items = create_list(:item, 3)

      item = items.first
      id = item.id
      name = item.name
      unit_price = item.unit_price
      description = item.description
      merchant_id = item.merchant_id

      get "/api/v1/items/find?unit_price=#{unit_price}"

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(item[:id]).to eq(id)
      expect(item[:name]).to eq(name)
      expect(item[:description]).to eq(description)
      expect(item[:merchant_id]).to eq(merchant_id)
      expect(item[:unit_price]).to eq(unit_price)
    end

    it 'returns an item based on created_at param' do
      items = create_list(:item, 3)

      item = items.first
      id = item.id
      name = item.name
      unit_price = item.unit_price
      description = item.description
      merchant_id = item.merchant_id

      get "/api/v1/items/find?created_at=#{item.created_at}"

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(item[:id]).to eq(id)
      expect(item[:name]).to eq(name)
      expect(item[:description]).to eq(description)
      expect(item[:merchant_id]).to eq(merchant_id)
      expect(item[:unit_price]).to eq(unit_price)
    end

    it 'returns an item based on updated_at param' do
      items = create_list(:item, 3)

      item = items.first
      id = item.id
      name = item.name
      unit_price = item.unit_price
      description = item.description
      merchant_id = item.merchant_id

      get "/api/v1/items/find?updated_at=#{item.updated_at}"

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(item[:id]).to eq(id)
      expect(item[:name]).to eq(name)
      expect(item[:description]).to eq(description)
      expect(item[:merchant_id]).to eq(merchant_id)
      expect(item[:unit_price]).to eq(unit_price)
    end
  end
end