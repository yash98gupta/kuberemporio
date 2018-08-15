class CheckoutController < ApplicationController

  helper_method :current_or_guest_user

  def index
    @cart_length=Shoppingcart.where(user_id: current_or_guest_user.id)
    if @cart_length.length==0
      redirect_to root_path
    else
    @comments=Comment.new
    @checkout_new=Checkout.new
    @user=User.new
    @checkout_all=Checkout.all
    @cart_all=Shoppingcart.where(user_id: current_or_guest_user.id)
    @shoppingcart_length=@cart_all.length
    @confirm_order_accordian=params[:id]
    end
  end

  def create
    @checkout=Checkout.new(
      first_name: params[:checkout][:first_name],
      last_name: params[:checkout][:last_name],
      email_address: params[:checkout][:email_address],
      phone: params[:checkout][:phone],
      country: params[:checkout][:country],
      state: params[:checkout][:state],
      city: params[:checkout][:city],
      pincode: params[:checkout][:pincode],
      house_no: params[:checkout][:house_no],
      street_name: params[:checkout][:street_name],
      landmark: params[:checkout][:landmark]
    )
    @checkout.user_id = current_user.id
    @checkout.save
    redirect_to checkout_index_path(:id => 'true')
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def confirm_order
    @cart_length=Shoppingcart.where(user_id: current_or_guest_user.id)
    if @cart_length.length==0
      redirect_to root_path
    else
    @confirm_order_checkout = Checkout.where(user_id: current_user.id)
    @confirm_order_comments = Comment.where(user_id: current_user.id)
    @cart_all=Shoppingcart.all.where(user_id:current_or_guest_user.id)
    @shoppingcart_length=@cart_all.length
    @sum=0
    end
  end

   def register
     @comment=Comment.create(
       comments: params[:comment][:comments]
     )
     @comment.user_id=current_user.id
     @comment.save
    redirect_to confirm_order_path
   end

  private
  def set_params
    params.require(:checkout).permit(:first_name,:last_name,:email_address,:phone,:country,:state,:city,:pincode,:house_no,:street_name,:landmark)
  end

end
