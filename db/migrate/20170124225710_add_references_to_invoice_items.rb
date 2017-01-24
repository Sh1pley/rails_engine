class AddReferencesToInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :invoice_items, :invoice_id
    add_reference :invoice_items, :invoice, index: true
  end
end
