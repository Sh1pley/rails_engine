class Merchant < ApplicationRecord
  validates :name, presence: true
  has_many :invoices
  has_many :items, through: :invoices
  has_many :transactions, through: :invoices 

  def self.revenue(date)
    joins(invoices: [:transactions, :invoice_items])
    .merge(Transaction.successful)
    .where(invoices: {created_at: date})
    .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def self.most_items(quantity = 1)
    select("merchants.*")
    .joins(invoices: [:transactions, :invoice_items])
    .merge(Transaction.successful)
    .order("sum(invoice_items.quantity) DESC")
    .group("merchants.id")
    .take(quantity)
  end

  def self.most_revenue(merchants = 1)
    select("merchants.*")
    .joins(invoices: [:transactions, :invoice_items])
    .merge(Transaction.successful)
    .order("sum(invoice_items.quantity * invoice_items.unit_price) DESC")
    .group("merchants.id")
    .take(merchants)
  end

  def revenue
    invoices 
    .joins(:transactions, :invoice_items)
    .merge(Transaction.successful)
    .sum("invoice_items.quantity * invoice_items.unit_price")
  end
end
