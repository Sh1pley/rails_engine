require 'rails_helper'

describe '/api/v1/merchants' do
  before :all do
    create_list(:merchant, 10)
  end

  it "should show JSON list for merchants" do
    get "/api/v1/merchants"
    merchants = JSON.parse(response.body)
    merchant = merchants.first

    expect(response).to be_success
    expect(merchant).to be_a(Hash)
    expect(merchant).to have_key('name')
  end
end
