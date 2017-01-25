class Api::V1::Merchants::RandomSearchController < ApplicationController
  def show
    render json: Merchant.random
  end
end
