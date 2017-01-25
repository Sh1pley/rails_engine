class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true
  validates :merchant_id, presence: true

  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  belongs_to :merchant

  def best_day
    invoices.joins(:transactions, :invoice_items)
    .merge(Transaction.successful)
    .select("invoices.created_at")
    .group(:created_at)
    .order("sum(invoice_items.quantity) DESC")
    .first
    .created_at
  end
end
