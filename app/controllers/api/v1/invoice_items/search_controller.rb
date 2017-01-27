class Api::V1::InvoiceItems::SearchController < ApplicationController
  def index
    render json: InvoiceItem.search_all(invoice_item_params)
  end

  def show
    render json: InvoiceItem.search(invoice_item_params)
  end

  private
  def invoice_item_params
    params.permit(:id, :quantity, :unit_price, :item_id, :created_at, :updated_at, :invoice_id)
  end
end
