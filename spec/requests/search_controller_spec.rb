require 'rails_helper'

describe 'items/find' do
  before :all do
    create_list(:item, 4)
    @item = create(:item, name: "Test", description: "Its a test!")
  end

  it 'returns item by id' do
    get "/api/v1/items/find?id=#{@item.id}"
    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["name"]).to eq(@item.name)
    expect(item["description"]).to eq(@item.description)
  end

  it 'returns item by name' do
    get "/api/v1/items/find?name=#{@item.name}"
    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["name"]).to eq(@item.name)
    expect(item["id"]).to eq(@item.id)
    expect(item["description"]).to eq(@item.description)
  end
end

describe 'items/find_all' do
  before :all do
    create_list(:item, 4)
    @item = create(:item, name: "Test Moar", description: "Its a Moar! test!")
    @item2 = create(:item, name: "Test Moar", description: "Its a Moar! test!")
  end

  it 'returns all items by item name' do
    get "/api/v1/items/find_all?name=#{@item.name}"
    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq(2)
  end

  it 'returns all items by item description' do
    get "/api/v1/items/find_all?description=#{@item2.description}"
    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq(2)
  end
end

require 'rails_helper'

describe 'invoices/find' do
  before :each do
    @customer = create(:customer)
    @customer.invoices << create_list(:invoice, 4)
    @invoice = create(:invoice)
  end

  it 'returns invoice by id' do
    get "/api/v1/invoices/find?id=#{@invoice.id}"
    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["status"]).to eq(@invoice.status)
    expect(invoice["id"]).to eq(@invoice.id)
  end

  it 'returns invoice by customer_id' do
    get "/api/v1/invoices/find?customer=#{@customer.id}"
    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["status"]).to eq(@invoice.status)
    expect(invoice.count).to eq(4)
    expect(invoice["customer_id"]).to_not eq(@invoice.customer_id)
  end
end

describe 'invoices/find_all' do
  before :each do
    create_list(:invoice, 4)
    @customer = create(:customer)
    @customer2 = create(:customer)
    @customer.invoices << create_list(:invoice, 3)
    @invoice = @customer.invoices.first
    @invoice2 = @customer.invoices.second
    @invoice2.update(status: "failed")
  end

  it 'returns all invoices by invoice status' do
    get "/api/v1/invoices/find_all?status=#{@invoice.status}"
    invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoices.count).to eq(32)
  end

  it 'returns all invoices by customer_id' do
    get "/api/v1/invoices/find_all?customer_id=#{@invoice2.customer_id}"
    invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoices.count).to eq(3)
  end
end