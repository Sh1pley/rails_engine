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

  def self.most_revenue(quantity)
    select("items.*")
    .joins(invoices: [:transactions, :invoice_items])
    .merge(Transaction.successful)
    .group(:id)
    .order("sum(invoice_items.quantity * invoice_items.unit_price) DESC")
    .take(quantity)
  end

  def self.most_items(quantity)
    select("items.*")
    .joins(invoices: [:transactions, :invoice_items])
    .merge(Transaction.successful)
    .group(:id)
    .order("count(invoice_items) DESC")
    .take(quantity)  
  end

  def self.search(params)
    if params.include? "unit_price"
      params[:unit_price] = (JSON.parse(params[:unit_price]).to_f * 100).round
      find_by(params)
    else
      where(params).sort.first
    end
  end

  def self.search_all(params)
    if params.include? "unit_price"
      params[:unit_price] = (JSON.parse(params[:unit_price]).to_f * 100).round
      where(params)
    else
      where(params)
    end
  end
end
