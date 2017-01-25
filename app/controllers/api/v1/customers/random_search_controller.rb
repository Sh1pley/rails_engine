class Api::V1::Customers::RandomSearchController < ApplicationController
  def show
    render json: Customer.random 
  end
end
