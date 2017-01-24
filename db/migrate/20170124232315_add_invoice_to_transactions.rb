class AddInvoiceToTransactions < ActiveRecord::Migration[5.0]
  def change
    remove_column :transactions, :invoice_id, :integer
    add_reference :transactions, :invoice, index: true
  end
end
