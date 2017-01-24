require 'rails_helper'

describe '/api/v1/items' do
  before :all do
    create_list(:item, 10)
  end

  it "should show JSON list for items" do
    get "/api/v1/items.json"
    items = Item.all

    expect(response).to be_success
    expect(items.count).to eq(10)
  end
end