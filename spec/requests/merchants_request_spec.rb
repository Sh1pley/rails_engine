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

  it '/most_items should show merchant with most items' do
    merchant = Merchant.second
    merchant2 = Merchant.first
    merchant.invoices << create(:invoice)
    merchant.invoices.first.invoice_items << create_list(:invoice_item, 10)
    invoice = merchant.invoices.first
    invoice.transactions << create(:transaction)

    get "/api/v1/merchants/most_items"

    result = JSON.parse(response.body)
    
    expect(response).to be_success
    expect(result["id"]).to eq(merchant.id)
    expect(result["name"]).to eq(merchant.name)
    expect(response.body).to_not include("#{merchant2.id}")
  end
end
