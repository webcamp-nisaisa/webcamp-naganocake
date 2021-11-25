class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @order_items = @order.order_items
    @order_item.update(order_item_params)
    if @order_item.producing?
      @order.production!
    elsif @order_items.count == @order_items.production_finish.count
      @order.ready_to_ship!
    end
    redirect_to admin_order_path(@order)
  end
  
  def order_item_params
    params.require(:order_item).permit(:making_status)
  end

end
