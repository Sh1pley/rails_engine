class Api::V1::Transactions::RandomSearchController < ApplicationController
  def show
    render json: Transaction.random 
  end
end
