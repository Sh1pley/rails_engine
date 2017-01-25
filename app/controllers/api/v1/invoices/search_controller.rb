class Api::V1::Invoices::SearchController < ApplicationController
  def index
    render json: Invoice.find(invoice_params)
  end

   def show
    render json: Invoice.where(invoice_params).first
  end
  private
    def invoice_params
    params.permit(:id, :status, :created_at, :updated_at)
  end
end 
