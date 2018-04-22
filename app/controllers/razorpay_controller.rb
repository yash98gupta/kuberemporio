class RazorpayController < ApplicationController

  def console
    byebug
    @answer_razor=Razorpay::Payment.fetch(params["payment_id"]).capture({amount: params["amount"]})
    # if @answer_razor.captured
        # @create_order_from_database=Payment.create razor_id: @answer_razor.id
        # @fetch_order_from_razorpay = Razorpay::Payment.fetch(@create_order_from_database.razor_id)
        @payment=Payment.new(
          payment_id:@answer_razor.id,
          amount:@answer_razor.amount,
          method:@answer_razor.method,
          bank:@answer_razor.bank,
          email:@answer_razor.email,
          contact_no:@answer_razor.contact,
          fee:@answer_razor.fee,
          tax:@answer_razor.tax
        )
        @payment.save
        Shoppingcart.all.each do |f|
          byebug
          Order.create(
          itemname: f.itemname,
          quantity: f.quantity,
          user_id: f.user_id,
          item_price: f.item_price,
          item_id: f.id
        )
        end
        Shoppingcart.all.each do |sc|
          @cart_destroy=Shoppingcart.find(sc.id)
          @cart_destroy.destroy
        end


        # Razor_pay_order.new(
        #   payment_details_id:@payment.id,
        #
        # )
      redirect_to root_path
    # else
      # redirect_to payment_error_path
    # end
  end

   # def error
   #   byebug
   # end
  #
  # def index
  #     @order=Razorpay::Order.all
  # end
  #
  # def payment_details
  #   byebug
  #   @payment_fetch = Razorpay::Order.fetch(params[:id])
  #   @payment = @payment_fetch.payments
  # end


end
