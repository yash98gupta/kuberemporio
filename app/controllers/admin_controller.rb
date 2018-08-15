class AdminController < ApplicationController

  def index
     # home page for admin user
        # All articles existing
        # All employees existing
        # All orders
        # Statistics
        # customer reviews

  end

  def show
    
  end


  def show_customer
    @customer_all=User.all
  end

  def orders
  end

  def profit
  end

  def loss
  end

  def item
    @article_new=Article.new
    @article_all=Article.all
  end


end
