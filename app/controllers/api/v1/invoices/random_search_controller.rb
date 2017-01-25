class Api::V1::Invoices::RandomSearchController < ApplicationController
  def show
    render json: Invoice.random 
  end
end
