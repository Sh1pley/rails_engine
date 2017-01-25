class Api::V1::Items::RandomSearchController < ApplicationController
  def show
    render json: Item.random
  end
end
