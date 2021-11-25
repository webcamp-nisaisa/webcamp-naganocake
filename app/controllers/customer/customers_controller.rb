class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer=current_customer
  end

  def edit
  	@customer=current_customer
  end

  def update
  	if current_customer.update(customer_params)
  	  redirect_to customers_mypage_path
  	else
  	  redirect_to request.referer
  	end
  end

  def unsubscribe
    @customer=current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_quited: true)
    reset_session
    redirect_to root_path
  end

  private
  	def customer_params
  		params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email, :is_quited)
  	end
end
