require 'rails_helper'

describe '/api/v1/merchants' do
  before :all do
    create_list(:merchant, 9)
  end

  it "should show JSON list for items" do
    get "/api/v1/items.json"
    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items.count).to eq(10)
    expect(item).to be_a(Hash)
    expect(item).to have_key('name')
    expect(item).to have_key('description')
    expect(item).to have_key('unit_price')
  end
end
