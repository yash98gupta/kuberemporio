class CheckoutController < ApplicationController
  def index
    @checkout_all=Checkout.all
    @cart_all=Shoppingcart.all.where(user_id:current_user.id)
    @shoppingcart_length=@cart_all.length

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
