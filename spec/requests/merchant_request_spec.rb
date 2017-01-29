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

  it "/revenue" do
    merchant = Merchant.last
    invoice = create(:invoice)
    merchant.invoices << invoice
    invoice_item = create(:invoice_item, unit_price: 10000)
    invoice.invoice_items << invoice_item
    transaction = create(:transaction)
    invoice.transactions << transaction
    get "/api/v1/merchants/#{merchant.id}/revenue"
    revenue = JSON.parse(response.body)
    expect(response).to be_success
    expect(revenue["revenue"]).to include("100")
  end
  
end