require 'rails_helper'

describe '/api/v1/invoice_item/:id/item' do
  it 'should return the item from the invoice item' do
    create(:invoice_item)
    invoice_item = InvoiceItem.first
    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    expect(response).to be_success
    expect(response.body).to include("id")
    expect(response.body).to include("name")
    expect(response.body).to include("description")
    expect(response.body).to include("unit_price")
  end
end