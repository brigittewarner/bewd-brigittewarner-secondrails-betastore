class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to root_path
    else
      render :new
    end
  end

  def verify
    customer = Customer.verify(params[:token])

    if customer
      # TODO: set_current_customer(customer)
      redirect_to root_path, notice: 'Your account is confirmed'
    else
      redirect_to root_path, alert: 'The verification is invalid'
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :email, :password, :password_confirmation)
    end
  
end