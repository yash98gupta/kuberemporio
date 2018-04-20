ActiveAdmin.register Order do

permit_params :Status

  filter :user_id, label:"Customer Id"
  filter :itemname
  filter :created_at, as: :date_range
  filter :quantity
  filter :item_price, label:"Price"
  filter :Status

  index do
    selectable_column
    column 'Article Id', :item_id
    column :itemname
    column :quantity
    column :item_price
    column 'User Id',:user_id
    column :Status
    actions
  end

  form do |f|
      f.inputs "Order Details" do
        f.input :itemname
        f.input :quantity
        f.input :item_price
        f.input :user_id, label: "User Id"
        f.input :Status
      end
      actions
    end

    sidebar :help do
  "Need help? Email us at help@example.com"
end


end
