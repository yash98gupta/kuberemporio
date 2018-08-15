class MyaccountController < ApplicationController
  def index
    @cart_all=Shoppingcart.all.where(user_id:current_or_guest_user.id)
    @shoppingcart_length=@cart_all.length
  
  end

  def myorders
    @orders=Order.where(user_id:current_user.id)
  end

  def myaddress
  end

  def newaddress
    @address_new=Address.new
  end

  def createaddress
    Address.create(
        country: params[:address][:country],
        state: params[:address][:state],
        city: params[:address][:city],
        pincode: params[:address][:pincode],
        landmark: params[:address][:landmark],
        house_no: params[:address][:house_no],
        street_name: params[:address][:street_name],
        user_id: current_user.id
    )
    redirect_to indexaddress_path
  end

  def editaddress
    @edit_address=Address.find(params[:id])
  end

  def updateaddress
    @update_address=Address.find(params[:id])
    @update_address.update(
      country: params[:address][:country],
      state: params[:address][:state],
      city: params[:address][:city],
      pincode: params[:address][:pincode],
      landmark: params[:address][:landmark],
      house_no: params[:address][:house_no],
      street_name: params[:address][:street_name],
      user_id: current_user.id
    )
    redirect_to indexaddress_path
  end

  def deleteaddress
      @delete_address=Address.find(params[:id])
      @delete_address.destroy
      redirect_to indexaddress_path
  end

  def indexaddress
    @existing_addresses = Address.where(user_id: current_user.id)
  end

  def favourites

  end

end
