FactoryGirl.define do
  factory :invoice_item do
    item
    invoice
    quantity 1
    unit_price 100
  end

  factory :item do
    name "Thing"
    description "Its a thing! Or something."
    unit_price 100
    merchant
  end
  
  factory :invoice do
    customer
    merchant
    status "shipped"
  end

  factory :merchant do
    name Faker::Name.name
  end

  factory :transaction do
    invoice
    credit_card_number Faker::Business.credit_card_number
    result "success"
  end

  factory :customer do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name

    factory :customer_with_invoices do
      transient do
        invoices_count 5
      end
      after(:create) do |customer, evaluator|
        create_list(:invoice, evaluator.invoices_count, customer: customer)
      end
    end
  end

end
