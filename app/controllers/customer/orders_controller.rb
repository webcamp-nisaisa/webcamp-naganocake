class Customer::OrdersController < ApplicationController
  def new
    @order=Order.new
    @credit_card=Order.payment_methods.key(0)
    @transfer=Order.payment_methods.key(1)
    @credit_card_ja=Order.payment_methods_i18n[:credit_card]
    @transfer_ja=Order.payment_methods_i18n[:transfer]
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def confirm
    params[:order][:select_address]
  end

  def create
  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:payment_method)
  end

end
