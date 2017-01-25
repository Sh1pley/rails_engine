class Api::V1::InvoiceItems::RandomSearchController < ApplicationController
  def show
    render json: InvoiceItem.random
  end
end
