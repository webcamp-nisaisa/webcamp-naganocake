class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order=Order.new
    @credit_card=Order.payment_methods.key(0)
    @transfer=Order.payment_methods.key(1)
    @credit_card_ja=Order.payment_methods_i18n[:credit_card]
    @transfer_ja=Order.payment_methods_i18n[:transfer]
  end

  def index
    @orders=current_customer.orders
  end

  def show
    if params[:id]=="confirm"
      redirect_to new_order_path
    else 
      @order = Order.find(params[:id])
    end
  end 

  def confirm
    @cart_items=current_customer.cart_items

    @order=Order.new(order_params)
    @order.shipping_fee=800
    @total_price_except_fee = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @order.total_price=@total_price_except_fee + @order.shipping_fee

    if params[:order][:select_address] == "0"
      @order.post_code=current_customer.post_code
      @order.address=current_customer.address
      @order.name=current_customer.full_name

    elsif params[:order][:select_address] == "1"
      @shipping=Shipping.find(params[:order][:shipping_id])
      @order.post_code=@shipping.post_code
      @order.address=@shipping.address
      @order.name=@shipping.name
    end
  end

  def create
    order=Order.new(order_params)
    order.customer_id=current_customer.id
    if order.save
      current_customer.cart_items.each do |cart_item|
        OrderItem.create(order_id: order.id,item_id: cart_item.item_id,amount: cart_item.amount,add_tax_price: cart_item.item.add_tax_price)
      end
      current_customer.cart_items.destroy_all
      redirect_to orders_complete_path
    else
      redirect_to action: :new
    end
  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:payment_method,:post_code,:address,:name,:shipping_fee,:total_price)
  end

end
