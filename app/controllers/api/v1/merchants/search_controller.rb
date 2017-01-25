class Api::V1::Merchants::SearchController < ApplicationController
  def index
    render json: Merchant.find(merchant_params)
  end

  def show
    render json: Merchant.where(merchant_params).first
  end
  private
  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
