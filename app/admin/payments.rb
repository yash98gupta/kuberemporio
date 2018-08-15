ActiveAdmin.register Payment do

  filter :created_at, as: :date_range
  filter :fee
  filter :tax
  filter :amount, as: :numeric_range_filter
  filter :payment_id, label:"Payment Id"

  index do
    selectable_column
    column :payment_id
    column :email
    column :method
    column :bank
    column :amount
    column :fee
    column :tax
    column :created_at
    actions
  end


end
