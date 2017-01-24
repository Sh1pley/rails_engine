class AddMerchantToItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :merchant_id, :integer
    add_reference :items, :merchant, index: true
  end
end
