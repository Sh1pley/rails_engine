require 'rails_helper'

describe 'RandomSearchController' do
  before :all do
    create_list(:invoice_item, 10)
    create_list(:transaction, 10)
  end

  it 'merchants/random shows JSON attr' do
    get '/api/v1/merchants/random.json'
    merchant_attributes = JSON.parse(response.body)

    expect(merchant_attributes).to be_a(Hash)
    expect(merchant_attributes.count).to eq(2)
    expect(merchant_attributes).to have_key('id')
    expect(merchant_attributes).to have_key('name')
  end

  it 'customers/random shows JSON attr' do
    get '/api/v1/customers/random.json'
    customer_attributes = JSON.parse(response.body)

    expect(customer_attributes).to be_a(Hash)
    expect(customer_attributes.count).to eq(5)
    expect(customer_attributes).to have_key('id')
    expect(customer_attributes).to have_key('first_name')
    expect(customer_attributes).to have_key('last_name')
  end

  it 'invoice_items/random shows JSON attr' do
    get '/api/v1/invoice_items/random.json'
    invoice_item_attributes = JSON.parse(response.body)

    expect(invoice_item_attributes).to be_a(Hash)
    expect(invoice_item_attributes.count).to eq(7)
    expect(invoice_item_attributes).to have_key('id')
    expect(invoice_item_attributes).to have_key('quantity')
    expect(invoice_item_attributes).to have_key('unit_price')
    expect(invoice_item_attributes).to have_key('item_id')
    expect(invoice_item_attributes).to have_key('invoice_id')
  end

  it 'invoices/random shows JSON attr' do
    get '/api/v1/invoices/random.json'
    invoice_attributes = JSON.parse(response.body)

    expect(invoice_attributes).to be_a(Hash)
    expect(invoice_attributes.count).to eq(6)
    expect(invoice_attributes).to have_key('id')
    expect(invoice_attributes).to have_key('status')
    expect(invoice_attributes).to have_key('customer_id')
    expect(invoice_attributes).to have_key('merchant_id')
  end

   it 'items/random shows JSON attr' do
    get '/api/v1/items/random.json'
    item_attributes = JSON.parse(response.body)

    expect(item_attributes).to be_a(Hash)
    expect(item_attributes.count).to eq(7)
    expect(item_attributes).to have_key('id')
    expect(item_attributes).to have_key('name')
    expect(item_attributes).to have_key('description')
    expect(item_attributes).to have_key('unit_price')
    expect(item_attributes).to have_key('merchant_id')
  end

   it 'transactions/random shows JSON attr' do
    get '/api/v1/transactions/random.json'
    transaction_attributes = JSON.parse(response.body)

    expect(transaction_attributes).to be_a(Hash)
    expect(transaction_attributes.count).to eq(7)
    expect(transaction_attributes).to have_key('id')
    expect(transaction_attributes).to have_key('credit_card_number')
    expect(transaction_attributes).to have_key('credit_card_expiration_date')
    expect(transaction_attributes).to have_key('result')
    expect(transaction_attributes).to have_key('invoice_id')
  end
end
