class CheckoutController < ApplicationController
  def index
    @checkout_all=Checkout.all
  end

  def new
    @checkout=Checkout.new
  end

  def create
    Checkout.create(set_params)
    redirect_to checkout_index_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_params
    params.require(:checkout).permit(:address, :pincode, :phone)
  end

end
