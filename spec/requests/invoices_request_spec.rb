require 'rails_helper'

describe 'Invoices' do
  before :each do
    create_list(:invoice, 4)
  end

  it "should show JSON list for invoices" do
    get "/api/v1/invoices.json"
    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices.count).to eq(7)
    expect(invoice).to be_a(Hash)
  end

  it "should show single JSON invoice for invoices/:id" do
    get "/api/v1/invoices/3.json"
    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice).to be_a(Hash)
  end
end