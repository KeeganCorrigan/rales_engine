require 'rails_helper'

describe 'Items API' do
	context 'GET /api/v1/items/find_all?parameters' do
		before :each do
			merchant = create(:merchant)
			items = create_list(:item, 3, merchant_id: merchant.id)
			@item = items.first
			Item.create!(name: 'he ya', description: 'the song by outkast', unit_price: 56789, merchant: create(:merchant), created_at: "2056-03-27 14:53:59", updated_at: "2056-03-27 14:57:59")
		end

		it 'returns items based on id param' do
			get "/api/v1/items/find_all?id=#{@item.id}"
		
			items = JSON.parse(response.body, symbolize_names: true)

			expect(response).to be_successful
			expect(items[0][:id]).to eq(@item.id)
			expect(items[0][:name]).to eq(@item.name)
			expect(items[0][:description]).to eq(@item.description)
		end

		it 'returns items based on description param' do
			get "/api/v1/items/find_all?description=#{@item.description}"
		
			items = JSON.parse(response.body, symbolize_names: true)

			expect(response).to be_successful
			expect(items.length).to eq(3)
			expect(Item.count).to eq(4)
			expect(items[0][:id]).to eq(@item.id)
			expect(items[0][:name]).to eq(@item.name)
			expect(items[0][:description]).to eq(@item.description)
		end

		it 'returns items based on merchant_id param' do
			get "/api/v1/items/find_all?merchant_id=#{@item.merchant_id}"
		
			items = JSON.parse(response.body, symbolize_names: true)

			expect(response).to be_successful
			expect(items.length).to eq(3)
			expect(Item.count).to eq(4)
			expect(items[0][:id]).to eq(@item.id)
			expect(items[0][:name]).to eq(@item.name)
			expect(items[0][:description]).to eq(@item.description)
		end

		it 'returns items based on unit_price param' do
			get "/api/v1/items/find_all?unit_price=#{@item.unit_price}"
		
			items = JSON.parse(response.body, symbolize_names: true)

			expect(response).to be_successful
			expect(items.length).to eq(3)
			expect(Item.count).to eq(4)
			expect(items[0][:id]).to eq(@item.id)
			expect(items[0][:name]).to eq(@item.name)
			expect(items[0][:description]).to eq(@item.description)
		end

		it 'returns items based on created_at param' do
			get "/api/v1/items/find_all?created_at=#{@item.created_at}"
		
			items = JSON.parse(response.body, symbolize_names: true)

			expect(response).to be_successful
			expect(items.length).to eq(3)
			expect(Item.count).to eq(4)
			expect(items[0][:id]).to eq(@item.id)
			expect(items[0][:name]).to eq(@item.name)
			expect(items[0][:description]).to eq(@item.description)
		end

		it 'returns items based on updated_at param' do
			get "/api/v1/items/find_all?updated_at=#{@item.updated_at}"
		
			items = JSON.parse(response.body, symbolize_names: true)

			expect(response).to be_successful
			expect(items.length).to eq(3)
			expect(Item.count).to eq(4)
			expect(items[0][:id]).to eq(@item.id)
			expect(items[0][:name]).to eq(@item.name)
			expect(items[0][:description]).to eq(@item.description)
		end
	end
end