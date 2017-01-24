class Customer < ApplicationRecord
  validates :first_name, :last_name, presence: true 
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices
  has_many :merchant, through: :invoices
end
