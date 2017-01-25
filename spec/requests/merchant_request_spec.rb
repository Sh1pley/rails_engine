require 'rails_helper'

describe 'merchants' do
  before :all do
    create_list(:merchant, 10)
  end

  it "/find? should show JSON item matching parameters" do
    merchant = Merchant.first
    
    get "/api/v1/merchants/find?name=#{merchant.name}"

    expect(response).to be_success
    expect(response.body).to include("name")
    expect(response.body).to include("#{merchant.name}")
  end
end