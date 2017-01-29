require 'rails_helper'

describe 'invoice_items/:id/invoice' do
  it 'will show a JSON invoice' do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"
    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice).to have_key("id")
    expect(invoice).to have_key("status")
    expect(invoice).to have_key("customer_id")
    expect(invoice).to have_key("merchant_id")
  end
end

describe '/invoice_items' do
  it 'should list all invoice_items' do
    invoice_items = create_list(:invoice_item, 5)
    get '/api/v1/invoice_items'
    invoice_item = JSON.parse(response.body).first
    expect(response).to be_success
    expect(invoice_item).to include("id")
    expect(invoice_item).to include("unit_price")
    expect(invoice_item).to include("quantity")
  end
end

describe '/api/v1/invoice_items/find_all' do
  it 'should find all invoice items by id' do
    item = create(:invoice_item)
    get "/api/v1/invoice_items/find_all?id=#{item.id}"
    invoice_item = JSON.parse(response.body).first
    expect(response).to be_success
    expect(invoice_item).to include("id")
    expect(invoice_item).to include("unit_price")
    expect(invoice_item).to include("quantity")
  end

  it 'should search unit_price formatted to a string' do
    item = create(:invoice_item, unit_price: 1200)
    unit_price = "12.00"
    get "/api/v1/invoice_items/find?unit_price=#{unit_price}"

    expect(response).to be_success
  end

end