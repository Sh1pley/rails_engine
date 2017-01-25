require 'rails_helper'

describe 'Items' do
  before :all do
    create_list(:item, 10)
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

  it "should show single JSON item for items/:id" do
    get "/api/v1/items/3.json"
    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item).to be_a(Hash)
    expect(item).to have_key('name')
    expect(item).to have_key('description')
    expect(item).to have_key('unit_price')
  end

  # it "should show best day for an item" do
  #   invoices = create_list(:invoice, 3)
  #   invoice = invoices.first
  #   invoice.transaction.create(result: "success",
  #                             credit_card_number: "0000000")
  #   invoice2 = Invoice.find(2)
  #   invoice2.transaction.create(result: "success",
  #                             credit_card_number: "0000000")
  #   invoice3 = Invoice.last
  #   invoice3.transaction.create(result: "failed",
  #                             credit_card_number: "0000000")
                                                                             
  #   item = Item.create(name: "thing",
  #                       description: "its a thing!",
  #                       unit_price: 100,
  #                       merchant_id: 1)

  #   invoice.invoice_items.create(quantity: 2,
  #                                 unit_price: 100,
  #                                 item_id: item.id)
  #   invoice2.invoice_items.create(quantity: 1,
  #                                 unit_price: 100,
  #                                 item_id: item.id)
  #   invoice3.invoice_items.create(quantity: 3,
  #                                 unit_price: 100,
  #                                 item_id: item.id)                                 


  #   get '/api/v1/items/1/best_day'
    
  #   expect(response.body).to have_content(invoice.created_at)
  # end
end

