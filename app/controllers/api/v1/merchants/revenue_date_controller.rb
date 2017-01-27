class Api::V1::Merchants::RevenueDateController < ApplicationController

  def show
    render json: Merchant.find(params[:id]).revenue_by_date(params[:date])
  end
end