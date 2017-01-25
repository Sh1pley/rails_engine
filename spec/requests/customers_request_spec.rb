require 'rails_helper'

describe '/api/v1/customers' do
  before :all do
    create_list(:customer, 10)
  end

  it "should show JSON list for customers" do
    get "/api/v1/customers.json"
    customers = JSON.parse(response.body)
    customer = customers.first

    expect(response).to be_success
    expect(customers.count).to eq(10)
    expect(customer).to be_a(Hash)
    expect(customer).to have_key('first_name')
    expect(customer).to have_key('last_name')
  end
end
