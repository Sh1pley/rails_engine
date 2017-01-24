class AddItemsToInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :invoice_items, :item_id, :integer
    add_reference :invoice_items, :item, index: true
  end
end
