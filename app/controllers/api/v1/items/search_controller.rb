class Api::V1::Items::SearchController < ApplicationController
  def index
    render json: Item.search_all(item_params)
  end

  def show
    render json: Item.search(item_params)
  end
  
  private
  def item_params
    params.permit(:id, :name, :description, :unit_price, :created_at, :updated_at, :merchant_id)
  end
end
