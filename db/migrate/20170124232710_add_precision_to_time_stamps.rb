class AddPrecisionToTimeStamps < ActiveRecord::Migration[5.0]
  def change
    change_column :customers, :created_at, :datetime, precision: 0
    change_column :customers, :updated_at, :datetime, precision: 0

    change_column :invoice_items, :created_at, :datetime, precision: 0
    change_column :invoice_items, :updated_at, :datetime, precision: 0
  
    change_column :invoices, :created_at, :datetime, precision: 0
    change_column :invoices, :updated_at, :datetime, precision: 0

    change_column :items, :created_at, :datetime, precision: 0
    change_column :items, :updated_at, :datetime, precision: 0

    change_column :merchants, :created_at, :datetime, precision: 0
    change_column :merchants, :updated_at, :datetime, precision: 0

    change_column :transactions, :created_at, :datetime, precision: 0
    change_column :transactions, :updated_at, :datetime, precision: 0
  end
end
