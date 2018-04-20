class BuyitemsController < ApplicationController
  def show

    @filter=session[:id].to_i
    @article_rating=Userrating.new
    @article_show=Article.find(params[:id])
    @item_new=Shoppingcart.new
    @article_rated=Userrating.find_by(:article_id => @article_show.id,:user_id => current_user.id)
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

  end

end
