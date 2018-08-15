Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  post 'razorpay/console'=>"razorpay#console"
  get 'razorpay/error' => "razorpay#error" ,as: "payment_error"
  get 'razorpay/index' => "razorpay#index" ,as: "payment_index"
  get 'razorpay/payment_details/:id' => "razorpay#payment_details" ,as: "order_payment_info"
  post '/rate' => 'rater#create', :as => 'rate'
  post 'checkout/register' => "checkout#register" ,as: "checkout_register"
  get 'checkout/confirm_order' => "checkout#confirm_order" , as:"confirm_order"
  delete 'shoppingcart/remove' => "shoppingcart#remove", as:"remove_from_shoppincart"
  delete 'shoppingcart/remove_confirm' => "shoppingcart#remove_confirm", as:"shoppincart_confirm"
  post 'articles/favourites' => "articles#favourites"
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        :registrations => "users/registrations"
      }

  resources :articles
  resources :buyitems
  resources :checkout
  get 'myaccount/index' => "myaccount#index", as: "my_account_index"
  get 'myaccount/myorders' => "myaccount#myorders", as: "my_account_myorders"

  get 'myaccount/myaddress' => "myaccount#myaddress", as: "my_account_myaddress"

  post 'myaccount/createaddress' => "myaccount#createaddress"
  get 'myaccount/newaddress' => "myaccount#newaddress"
  get 'myaccount/indexaddress' => "myaccount#indexaddress" , as: "indexaddress"
  get 'myaccount/editaddress/:id' => "myaccount#editaddress", as: "editaddress"
  delete 'myaccount/deleteaddress/:id' => "myaccount#deleteaddress" , as: "deleteaddress"
  patch 'myaccount/updateaddress/:id' => "myaccount#updateaddress"

  get 'admin/index' => "admin#index"
  get 'admin/item' => "admin#item" , as: "all_items"
  get 'admin/show_customers' => "admin#show_customers" , as: "all_customers"

  get 'homepage/index/:filter_id' => "homepage#index", as: "homepage_index"
  get 'homepage/index_root' => "homepage#index_root"
  post 'userrating/articlerating/:id' => "userrating#articlerating"
  post 'shoppingcart/create/(:item_name)/(:item_quantity)' => "shoppingcart#create" , as: "shopping_add"
  resources :shoppingcart, only: [:index,:destroy,:edit,:update]
  get 'filter/incPrice' => "filter#incPrice"
  get 'filter/decPrice' => "filter#decPrice"
  root 'homepage#index_root'
end
