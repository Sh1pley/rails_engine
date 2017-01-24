require 'rails_helper'

describe Customer do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without name" do
        customer = Customer.create()

        expect(customer).to be_invalid
      end
    end
  end
end
