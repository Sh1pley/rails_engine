class Api::V1::Customers::SearchController < ApplicationController
  def index
    render json: Customer.find(customer_params)
  end

  def show
    render json: Customer.where(customer_params).first
  end
  private
  def customer_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end
