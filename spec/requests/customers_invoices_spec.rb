require 'rails_helper'

describe '/api/v1/customers' do
  let(:customer) { create(:customer_with_invoices) }


  it "should show JSON list for customers invoices" do
    get "/api/v1/customers/#{customer.id}/invoices.json"

    customer_invoice = JSON.parse(response.body)
    invoice = customer_invoice.first

    expect(response).to be_success
    expect(customer_invoice.count).to eq(5)
    # expect(customer_invoice).to eq([{"id"=>5, "status"=>0, "customer_id"=>1, "merchant_id"=>5}, {"id"=>4, "status"=>0, "customer_id"=>1, "merchant_id"=>4}, {"id"=>3, "status"=>0, "customer_id"=>1, "merchant_id"=>3}, {"id"=>2, "status"=>0, "customer_id"=>1, "merchant_id"=>2}, {"id"=>1, "status"=>0, "customer_id"=>1, "merchant_id"=>1}])
  end
end
