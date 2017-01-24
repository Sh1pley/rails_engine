class AddCustomersAndMerchantsToInvoices < ActiveRecord::Migration[5.0]
  def change
    remove_column :invoices, :customer_id, :integer
    add_reference :invoices, :customer, index: true

    remove_column :invoices, :merchant_id, :integer
    add_reference :invoices, :merchant, index: true
  end
end
