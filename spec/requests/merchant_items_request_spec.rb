require 'rails_helper'

describe '/merchants/:id/items' do
  before :all do
    @merchant = create(:merchant)
    invoice = create(:invoice)
    @items = create_list(:invoice_item, 5)
    invoice.invoice_items << @items
    @merchant.invoices << invoice
  end

  it 'should show JSON list of items' do
    get "/api/v1/merchants/#{@merchant.id}/items"
    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items.count).to eq(5)
    expect(item).to have_key("merchant_id")
    expect(item).to have_key("name")
    expect(item).to have_key("description")
    end
end