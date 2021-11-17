class Customer::ShippingsController < ApplicationController
  def index
    @shippings=Shipping.all
    @shipping=Shipping.new
  end

  def create
    current_user.shippings.create(shipping_params)
    redirect_back(fallback_location:root_path)
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private
  def shipping_params
    params.require(:shipping).permit(:post_code,:address,:name)
  end

end
