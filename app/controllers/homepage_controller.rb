
class HomepageController < ApplicationController
  before_action :set_event, only: [:index, :index_root]
  helper_method :current_or_guest_user

  def index
    if session[:filter_id].nil?
      session[:filter_id] = 0
    else
      session[:filter_id] = params[:filter_id]
    end
    @order_type = params[:id]
    if @order_type.to_i==1
      @article_all=Article.all.order("price DESC").paginate(page: params[:page], per_page: 4)
    elsif @order_type.to_i==2
      @article_all=Article.all.order("price ASC").paginate(page: params[:page], per_page: 4)
    elsif @order_type.to_i==3
      Article.all.each do |a|
        @sum=0
        @user_rating=Userrating.where(article_id: a.id)
        if @user_rating!=nil
          @user_rating.each do |u|
            @sum=@sum+u.user_rating
          end
          a.usr_rating=@sum/@user_rating.length
          a.save
        else
          a.usr_rating=@sum+2
          a.save
        end
      end
      @article_all=Article.all.order("usr_rating ASC").paginate(page: params[:page], per_page: 4)
    else
    @article_all=Article.all.order("created_at ASC").paginate(page: params[:page], per_page: 4)
  end
end
# upper action is not being used its a bad method to handle session we handle session through query params
def index_root

    @cart_all=Shoppingcart.all.where(user_id:current_or_guest_user.id)
    @shoppingcart_length=@cart_all.length
  # else
  #   @shoppingcart_length=

  Article.all.each do |a|
    @sum=0
    @user_rating=Userrating.where(article_id: a.id)
    if @user_rating!=nil&&@user_rating.length!=0
      @user_rating.each do |u|
        @sum=@sum+u.user_rating
      end
      a.usr_rating=@sum/@user_rating.length
      a.save
    else
      a.usr_rating=2
      a.save
    end
  end
    if params[:id].to_i==1
      session[:id]=params[:id]
      @article_all=Article.all.order("price DESC").paginate(page: params[:page], per_page: 4)
    elsif params[:id].to_i==2
      session[:id]=params[:id]
      @article_all=Article.all.order("price ASC").paginate(page: params[:page], per_page: 4)
    elsif params[:id].to_i==3
      session[:id]=params[:id]
      @article_all=Article.all.order("usr_rating ASC").paginate(page: params[:page], per_page: 4)
    else
      @article_all=Article.all.order("created_at ASC").paginate(page: params[:page], per_page: 4)
    end

end

    private
    def set_event
      Article.all.each do |a|
        @sum=0
        @user_rating=Userrating.where(article_id: a.id)
        if @user_rating!=nil
          @user_rating.each do |u|
            @sum=@sum+u.user_rating
          end
          a.usr_rating=@sum
          a.save
        end
      end
    end
end
