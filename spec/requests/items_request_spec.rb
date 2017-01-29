require 'rails_helper'

describe 'Items' do
  before :all do
    create_list(:item, 10)
    @item = Item.first
  end

  it "should show JSON list for items" do
    get "/api/v1/items"
    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items.count).to eq(10)
    expect(item).to be_a(Hash)
    expect(item).to have_key('name')
    expect(item).to have_key('description')
    expect(item).to have_key('unit_price')
  end

  it "should show single JSON item for items/:id" do
    get "/api/v1/items/#{@item.id}"
    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item).to be_a(Hash)
    expect(item).to have_key('name')
    expect(item).to have_key('description')
    expect(item).to have_key('unit_price')
  end
end
