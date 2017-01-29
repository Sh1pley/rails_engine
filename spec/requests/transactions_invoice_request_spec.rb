require 'rails_helper'

describe '/transactions/:id/invoice' do
  before :each do
    @transactions = create_list(:transaction, 5)
    @transaction = Transaction.last
  end

  it 'should show the invoice related to that transaction' do
    get "/api/v1/transactions/#{@transaction.id}/invoice"
    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["customer_id"]).to eq(@transaction.invoice.customer_id)
    expect(invoice["merchant_id"]).to eq(@transaction.invoice.merchant_id)
    expect(invoice["status"]).to eq(@transaction.invoice.status)
  end
end