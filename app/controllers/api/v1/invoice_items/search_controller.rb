class Api::V1::InvoiceItems::SearchController < ApplicationController
  def index
    render json: InvoiceItem.find(invoice_item_params)
  end

  def show
    render json: InvoiceItem.where(invoice_item_params).first
  end
  
  private
  def invoice_item_params
    params.permit(:id, :quantity, :unit_price, :created_at, :updated_at)
  end
end
