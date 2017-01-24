require 'rails_helper'

describe Transaction do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without title" do
        transaction = Transaction.create()

        expect(transaction).to be_invalid
      end
    end
  end
end
