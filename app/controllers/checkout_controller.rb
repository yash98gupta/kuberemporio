class CheckoutController < ApplicationController
  def index
    @checkout_all=Checkout.all
<<<<<<< HEAD
    @cart_all=Shoppingcart.all.where(user_id:current_user.id)
    @shoppingcart_length=@cart_all.length
=======
>>>>>>> 92422452049f5a93766e7474d468187e4397ccb8
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
