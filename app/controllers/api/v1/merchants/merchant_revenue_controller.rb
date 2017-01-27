class Api::V1::Merchants::MerchantRevenueController < ApplicationController 
  def show
    if params[:date] != nil
      render json: Merchant.find(params[:id]).revenue_by_date(params[:date]), serializer: MerchantRevenueSerializer
    else 
      render json: Merchant.find(params[:id]).revenue, serializer: MerchantRevenueSerializer
    end
  end
end