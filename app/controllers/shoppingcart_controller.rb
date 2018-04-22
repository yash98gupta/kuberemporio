class ShoppingcartController < ApplicationController

  def index
    @cart_all=Shoppingcart.all.where(user_id:current_user.id)
    @shoppingcart_length=@cart_all.length
    @sum=0
end


  def create

    @cart_exists=Shoppingcart.find_by(user_id:current_user.id,item_id:params[:shoppingcart][:item_id].to_i)
    if @cart_exists!=nil
       @cart_exists.quantity = @cart_exists.quantity + params[:shoppingcart][:item_quantity].to_i
       @cart_exists.save
    else
    @cart_add=Shoppingcart.create(
      itemname: params[:shoppingcart][:item_name],
      quantity: params[:shoppingcart][:item_quantity].to_i,
      item_id: params[:shoppingcart][:item_id].to_i,
      item_price: params[:shoppingcart][:item_price].to_i,
    )
    @cart_add.user_id=current_user.id
    @cart_add.save!
    end
    redirect_to shoppingcart_index_path
  end

  def edit
    @cart_edit=Shoppingcart.find(params[:id])
  end


    def update
      @cart_update=Shoppingcart.find(params[:id])
      @shoppingcart_update=@cart_update.update(set_params)
      redirect_to shoppingcart_index_path
    end

  def destroy
    @cart_destroy=Shoppingcart.find(params[:id])
    @cart_destroy.destroy
    redirect_to  shoppingcart_index_path
  end


    private

      def set_params
        params.require(:shoppingcart).permit(:itemname, :quantity,:item_price,:item_id,:avatar)
      end

end
