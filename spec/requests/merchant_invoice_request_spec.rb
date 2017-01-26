require 'rails_helper'

describe '/merchants/:id/invoices' do
  before :all do
    @merchant = create(:merchant)
    @invoices = create_list(:invoice, 5)
    @merchant.invoices << @invoices
  end

  it 'should show JSON list of invoices' do
    get "/api/v1/merchants/#{@merchant.id}/invoices"
    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices.count).to eq(5)
    expect(invoice).to include("customer_id")
    end
end