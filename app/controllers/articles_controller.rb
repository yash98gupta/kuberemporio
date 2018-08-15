class ArticlesController < ApplicationController

  def index
    @article_all=Article.all
  end

  def new
    @article_new=Article.new
  end

  def create
    @article_create=Article.new(set_params)
    @article_create.save
    redirect_to admin_index_path
  end

  def edit
    @article_edit=Article.find(params[:id])
  end

  def update
    @article_to_be_edited=Article.find(params[:id])
    @article_update=Article.find(params[:id]).update(set_params)
    redirect_to admin_index_path
  end

  def destroy
    @article_to_be_destroyed=Article.find(params[:id])
    @article_to_be_edited=Article.find(params[:id]).destroy
    redirect_to admin_index_path
  end

  def favourites

    @product=Article.find(params[:product_id])
    @product.favourite=params[:fav]
    @product.save
  end


  private

    def set_params
      params.require(:article).permit(:articleimg,:articleimg1,:articleimg2,:articleimg3,:articleimg4,:name, :quantity ,:description, :price, :weight, :faqs,:company, :discount, :material, :colour, :reviews, :height)
    end

end

# 0 . Article image
# 1 . DESCRIPTION
# 2 . PRICE
# 3 . specs(weight,height)
# 4 . FAQS
# 5 . RATING
# 6 . COMPANY
# 7 . DISCOUNT
# 8 . MATERIAL
# 9 . COLOR
# 10. CUSTOMER Review
# 11. quantity
