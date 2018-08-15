class ShoppingcartController < ApplicationController

  helper_method :current_or_guest_user


  def index

    @cart_length=Shoppingcart.where(user_id: current_or_guest_user.id)
    if @cart_length.length==0
      redirect_to root_path
    else
    @cart_all = Shoppingcart.where(user_id:current_or_guest_user.id)
    @shoppingcart_length = @cart_all.length
    @sum=0
    end
  end


  def create

    @cart_exists=Shoppingcart.find_by(user_id:current_or_guest_user.id,item_id:params[:shoppingcart][:item_id].to_i)
    if @cart_exists!=nil
       @cart_exists.quantity = params[:shoppingcart][:item_quantity].to_i
       @cart_exists.save
    else
    @cart_add=Shoppingcart.new(
      itemname: params[:shoppingcart][:item_name],
      quantity: params[:shoppingcart][:item_quantity].to_i,
      item_id: params[:shoppingcart][:item_id].to_i,
      item_price: params[:shoppingcart][:item_price].to_i,
      discount: params[:shoppingcart][:discount].to_i
    )
    @cart_add.user_id=current_or_guest_user.id
    @cart_add.save!
    end
    redirect_to shoppingcart_index_path
  end

  def edit
    @cart_edit=Shoppingcart.find(params[:id])
  end


    def update

      @cart_update=Shoppingcart.find(params[:product_id])
      @cart_update.quantity=params[:quantity]
      @cart_update.save
      redirect_to shoppingcart_index_path
    end

  def destroy
    @cart_destroy=Shoppingcart.find(params[:id])
    @cart_destroy.destroy
    redirect_to  shoppingcart_index_path
  end

  def remove

    params[:product_ids].each do |product|
      @product=Shoppingcart.where(id: product , user_id: current_or_guest_user.id)
      @product[0].destroy
    end
    @cart_length=Shoppingcart.where(user_id: current_or_guest_user.id)
    if @cart_length.length==0
      redirect_to root_path
    else
      redirect_to shoppingcart_index_path
    end
  end

  def remove_confirm

    params[:product_ids].each do |product|
      @product=Shoppingcart.where(id: product , user_id: current_or_guest_user.id)
      @product[0].destroy
    end
    @cart_length=Shoppingcart.where(user_id: current_or_guest_user.id)
    if @cart_length.length==0
      redirect_to root_path
    else
      redirect_to confirm_order_path
    end
  end


    private

      def set_params
        params.require(:shoppingcart).permit(:item_id)
      end

end
