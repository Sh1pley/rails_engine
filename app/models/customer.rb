class Customer < ApplicationRecord
  validates :first_name, :last_name, presence: true 
  has_many :invoice_items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
      merchants.joins(:transactions)
      .merge(Transaction.successful)
      .group(:id)
      .order("count(transactions) DESC")
      .first
  end
end
