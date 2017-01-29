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

  it 'returns all items'
end