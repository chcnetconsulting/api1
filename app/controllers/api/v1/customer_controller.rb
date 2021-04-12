class Api::V1::CustomerController < ApplicationController
  def show
    render json: Customer.find(params[:id])
  end
end
