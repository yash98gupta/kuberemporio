Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  post 'razorpay/console'=>"razorpay#console"
  get 'razorpay/error' => "razorpay#error" ,as: "payment_error"
  get 'razorpay/index' => "razorpay#index" ,as: "payment_index"
  get 'razorpay/payment_details/:id' => "razorpay#payment_details" ,as: "order_payment_info"
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  resources :articles
  resources :buyitems
  resources :checkout
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
