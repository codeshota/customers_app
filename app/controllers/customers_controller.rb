class CustomersController < ApplicationController
  before_action :find_customer, only: [:destroy, :edit, :update, :enable]

  def index
    @customers = Customer.all
  end

  def black_list
    @customers = Customer.all
  end

  def destroy
    @customer.update(black_list: true)
    redirect_to root_path
  end

  def enable
    @customer.update(black_list: false)
    redirect_to black_list_path
  end

  def edit
  end
  
  def update
    if @customer.update(customer_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end
  
  private
  def customer_params
    params.require(:customer).permit(:name, :phone, :description)
  end

  def find_customer
    @customer = Customer.find(params[:id])
  end

end
