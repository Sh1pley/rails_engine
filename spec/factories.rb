FactoryGirl.define do
  factory :invoice_item do
    item_id 1
    invoice_id 1
    quantity 1
    unit_price 1
  end
  factory :item do
    name "Thing"
    description "Its a thing! Or something."
    unit_price 1
    merchant_id 1
  end
  factory :invoice do
    customer_id 1
    merchant_id 1
    status 0
  end

  factory :customer do
    first_name "John"
    last_name "Smith"
  end
end
