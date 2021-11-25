class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @total_price_except_fee = @order_items.inject(0) { |sum, item| sum + item.sum_of_item_price }
    @order.total_price = @total_price_except_fee + @order.shipping_fee
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.confirmation?
      @order.order_items.each do |order_item|
      order_item.production_waiting!
      end
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:ordering_status)
  end

end
