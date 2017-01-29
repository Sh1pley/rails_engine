require 'rails_helper'

describe 'Invoices' do
  before :each do
    create_list(:invoice, 5)
    @invoice = Invoice.first
  end

  it "should show JSON list for invoices" do
    get "/api/v1/invoices"
    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices.count).to eq(5)
    expect(invoice).to be_a(Hash)
  end

  it "should show single JSON invoice for invoices/:id" do
    get "/api/v1/invoices/#{@invoice.id}"
    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice).to be_a(Hash)
    expect(response.body).to include("status")
  end
end
