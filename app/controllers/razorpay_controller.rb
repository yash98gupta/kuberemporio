class RazorpayController < ApplicationController
before_action :authenticate_user!
helper_method :current_or_guest_user

  def console

    @answer_razor=Razorpay::Payment.fetch(params["payment_id"]).capture({amount: params["amount"].to_i})
    # if @answer_razor.captured
        # @create_order_from_database=Payment.create razor_id: @answer_razor.id
        # @fetch_order_from_razorpay = Razorpay::Payment.fetch(@create_order_from_database.razor_id)
        @payment=Payment.new(
          payment_id:@answer_razor.id,
          amount:@answer_razor.amount.to_i/100,
          method:@answer_razor.method,
          bank:@answer_razor.bank,
          email:@answer_razor.email,
          contact_no:@answer_razor.contact,
          fee:@answer_razor.fee,
          tax:@answer_razor.tax
        )
        @payment.save!
        @shoppingcart = Shoppingcart.where(user_id: current_user.id)
        @shoppingcart.all.each do |f|

        @order=Order.new(
          itemname: f.itemname,
          quantity: f.quantity,
          item_price: f.item_price,
          item_id: f.id
        )
        @order.user_id = current_user.id
        @checkout=Checkout.where(user_id: current_user)
        @order.checkout_id=@checkout.last.id
        @order.save!
        end
        @shoppingcart.all.each do |sc|
          @cart_destroy=Shoppingcart.find(sc.id)
          @cart_destroy.destroy
        end

      # redirect_to root_path
      render js: "window.location = '#{root_path}'"
        # Razor_pay_order.new(
        #   payment_details_id:@payment.id,
        #
        # )
    # else
      # redirect_to payment_error_path
    # end
  end

   # def error
   #
   # end
  #
  # def index
  #     @order=Razorpay::Order.all
  # end
  #
  # def payment_details
  #
  #   @payment_fetch = Razorpay::Order.fetch(params[:id])
  #   @payment = @payment_fetch.payments
  # end


end
