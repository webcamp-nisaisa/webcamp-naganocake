class Customer::ShippingsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @shipping=Shipping.new
    @shippings=current_customer.shippings
  end

  def create
    shipping=Shipping.new(shipping_params)
    shipping.customer_id=current_customer.id
    if shipping.save
      redirect_back(fallback_location:root_path)
    else
      redirect_to request.referer
    end
  end

  def destroy
    shipping=Shipping.find(params[:id])
    shipping.destroy
    redirect_back(fallback_location:root_path)
  end

  def edit
    @shipping=Shipping.find(params[:id])
  end

  def update
    @shipping=Shipping.find(params[:id])
    if @shipping.update(shipping_params)
      redirect_to shippings_path
    else
      redirect_to request.referer
    end
  end

  private
  def shipping_params
    params.require(:shipping).permit(:post_code,:address,:name)
  end

end
