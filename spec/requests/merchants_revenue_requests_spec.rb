require 'rails_helper'

describe 'merchants/most_revenue' do
  it 'returns top merchant sorted by revenue' do
    merchants = create_list(:merchant, 5)
    merchant = Merchant.last
    merchant.invoices << create(:invoice)
    invoice = merchant.invoices.first
    merchant.invoices.first.transactions << create(:transaction)
    invoice.invoice_items << create(:invoice_item, unit_price: 2100)

    get "/api/v1/merchants/most_revenue"
    most = JSON.parse(response.body)

    expect(response).to be_success
    expect(most["id"]).to eq(merchant.id)
    expect(most["name"]).to eq(merchant.name)
  end
end

describe 'merchants/revenue(:date)' do
  it 'returns the total revenue on a date' do
    merchants = create_list(:merchant, 5)
    merchant = Merchant.last
    merchant.invoices << create(:invoice)
    invoice = merchant.invoices.first
    merchant.invoices.first.transactions << create(:transaction)
    invoice.invoice_items << create(:invoice_item, unit_price: 2000)

    get "/api/v1/merchants/revenue?date=#{invoice.created_at}"
    most = JSON.parse(response.body)

    expect(response).to be_success
    expect(most["total_revenue"]).to eq("20.0")
  end
end