FactoryGirl.define do
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
end