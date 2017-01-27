class InvoiceItem < ApplicationRecord
  validates :item_id, presence: true
  validates :invoice_id, presence: true
  validates :quantity, presence: true
  validates :unit_price, presence: true

  belongs_to :item
  belongs_to :invoice

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
