require 'rails_helper'

describe '/api/v1/transactions' do
  before :all do
    create_list(:transaction, 10)
  end

  it "should show JSON list for transactions" do
    get "/api/v1/transactions"
    transactions = JSON.parse(response.body)
    transaction = transactions.first

    expect(response).to be_success
    expect(transactions.count).to eq(20)
    expect(transaction).to be_a(Hash)
    expect(transaction).to have_key('invoice_id')
    expect(transaction).to have_key('credit_card_number')
    expect(transaction).to have_key('result')
  end

  it "should search by invoice_id" do
    transaction = Transaction.first
    invoice = create(:invoice)
    get "/api/v1/transactions/find?invoice_id=#{transaction.invoice_id}"

    expect(response).to be_success
  end
end
