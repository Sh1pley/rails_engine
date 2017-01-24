require 'rails_helper'

describe Merchant do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without name" do
        merchant = Merchant.create()

        expect(merchant).to be_invalid
      end
    end
  end
end
