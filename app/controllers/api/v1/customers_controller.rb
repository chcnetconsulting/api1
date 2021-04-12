class Api::V1::CustomersController < ApplicationController
  before_action :check_login, only: %i[create]


  def show
    render json: Customer.find(params[:id])
  end

  def index
    render json: Customer.all
  end

  def create
    customer = current_user.customers.build(customer_params)
    if customer.save
      render json: customer, status: :created
    end
  end


  private

  ## define all allowed customer fields
  def customer_params
    params.require(:customer).permit(:name, :lastname, :firstname, :zipcode, :address, :vatid, :locked, :active)
  end
end
