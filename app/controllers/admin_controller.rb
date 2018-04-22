class AdminController < ApplicationController

  def index
     # home page for admin user
        # All articles existing
        # All employees existing
        # All orders
        # Statistics
        # customer reviews

  end

<<<<<<< HEAD
  def show
    
  end


  def show_customer
=======

  def show_customers
>>>>>>> 92422452049f5a93766e7474d468187e4397ccb8
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
