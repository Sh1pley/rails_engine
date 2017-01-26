class Api::V1::Merchants::MerchantRevenueController < ApplicationController 
  def show 
    render json: Merchant.find(params[:id]).revenue, serializer: MerchantRevenueSerializer
  end
end