class BuyitemsController < ApplicationController

  helper_method :current_or_guest_user

  def show
    @article_views=Article.find(params[:id])
    @article_views.views = @article_views.views + 1
    @article_views.save

    @article_fav=Article.where(favourite: true).paginate(page: params[:page], per_page: 1)

    @cart_all = Shoppingcart.all.where(user_id:current_or_guest_user.id)

    @shoppingcart_length = @cart_all.length

    @item_in_shoppingcart=Shoppingcart.find_by(user_id:current_or_guest_user.id,item_id:params[:id])

        @filter=session[:id].to_i

        @article_rating=Userrating.new

        @article_show=Article.find(params[:id])

        @item_new=Shoppingcart.new

        if current_user
            @article_rated=Userrating.find_by(:article_id => @article_show.id,:user_id => current_user.id)
        end
        @all_user_rating=Userrating.where(:article_id => @article_show.id)
        @sum=2

          if @all_user_rating.length == 0

              @sum=2
              @total=1

          else

            @all_user_rating.each do |each_user|
            @sum = @sum + each_user.user_rating

          end

            @total=@all_user_rating.length

          end

          @article_recommended=Article.all.order("views DESC").paginate(page: params[:page], per_page: 4)

  end

end
