require 'rails_helper'

describe '/api/v1/transactions' do
  before :all do
    create_list(:transaction, 10)
  end

  it "should show JSON list for transactions" do
    get "/api/v1/transactions.json"
    transactions = JSON.parse(response.body)
    transaction = transactions.first

    expect(response).to be_success
    expect(transactions.count).to eq(20)
    expect(transaction).to be_a(Hash)
    expect(transaction).to have_key('invoice_id')
    expect(transaction).to have_key('credit_card_number')
    expect(transaction).to have_key('credit_card_expiration_date')
    expect(transaction).to have_key('result')
  end
end
