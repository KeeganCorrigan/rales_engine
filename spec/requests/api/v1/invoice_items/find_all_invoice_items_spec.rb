require 'rails_helper'

describe 'Invoice Items API' do
  before :each do
    invoice = create(:invoice)
    item = create(:item)
    invoice = create(:invoice)
    invoice_items = create_list(:invoice_item, 3, item: item, invoice: invoice, quantity: 1)
    @invoice_item = invoice_items.first
    InvoiceItem.create!(item: create(:item), invoice: create(:invoice), quantity: 543, unit_price: 65432, created_at: "2019-08-13 18:24:47", updated_at: "2020-08-13 18:24:47")
  end

  it 'returns invoice_items based on id param' do
    get "/api/v1/invoice_items/find_all?id=#{@invoice_item.id}"

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_items[0][:id]).to eq(@invoice_item.id)
    expect(invoice_items[0][:quantity]).to eq(@invoice_item.quantity)
    expect(invoice_items[0][:invoice_id]).to eq(@invoice_item.invoice_id)
  end

  it 'returns invoice_items based on item_id param' do
    get "/api/v1/invoice_items/find_all?item_id=#{@invoice_item.item_id}"

    invoice_items = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to be_successful
    expect(invoice_items.length).to eq(3)
    expect(invoice_items[0][:id]).to eq(@invoice_item.id)
    expect(invoice_items[0][:quantity]).to eq(@invoice_item.quantity)
    expect(invoice_items[0][:invoice_id]).to eq(@invoice_item.invoice_id)
  end

  it 'returns invoice_items based on invoice_id param' do
    get "/api/v1/invoice_items/find_all?invoice_id=#{@invoice_item.invoice_id}"

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_items.length).to eq(3)
    expect(invoice_items[0][:id]).to eq(@invoice_item.id)
    expect(invoice_items[0][:quantity]).to eq(@invoice_item.quantity)
    expect(invoice_items[0][:invoice_id]).to eq(@invoice_item.invoice_id)
  end

  it 'returns invoice_items based on quantity param' do
    get "/api/v1/invoice_items/find_all?quantity=#{@invoice_item.quantity}"

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_items.length).to eq(3)
    expect(invoice_items[0][:id]).to eq(@invoice_item.id)
    expect(invoice_items[0][:quantity]).to eq(@invoice_item.quantity)
    expect(invoice_items[0][:invoice_id]).to eq(@invoice_item.invoice_id)
  end

  it 'returns invoice_items based on unit_price param' do
    get "/api/v1/invoice_items/find_all?unit_price=#{@invoice_item.unit_price}"

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_items.length).to eq(3)
    expect(invoice_items[0][:id]).to eq(@invoice_item.id)
    expect(invoice_items[0][:quantity]).to eq(@invoice_item.quantity)
    expect(invoice_items[0][:invoice_id]).to eq(@invoice_item.invoice_id)
  end

  it 'returns invoice_items based on created_at param' do
    get "/api/v1/invoice_items/find_all?created_at=#{@invoice_item.created_at}"

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_items.length).to eq(3)
    expect(invoice_items[0][:id]).to eq(@invoice_item.id)
    expect(invoice_items[0][:quantity]).to eq(@invoice_item.quantity)
    expect(invoice_items[0][:invoice_id]).to eq(@invoice_item.invoice_id)
  end

  it 'returns invoice_items based on updated_at param' do
    get "/api/v1/invoice_items/find_all?updated_at=#{@invoice_item.updated_at}"

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_items.length).to eq(3)
    expect(invoice_items[0][:id]).to eq(@invoice_item.id)
    expect(invoice_items[0][:quantity]).to eq(@invoice_item.quantity)
    expect(invoice_items[0][:invoice_id]).to eq(@invoice_item.invoice_id)
  end
end