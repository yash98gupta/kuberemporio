ActiveAdmin.register User do

  filter :id
  filter :email
  filter :created_at
  filter :sign_in_count, as: :numeric_range_filter

  index do
    selectable_column
    column 'Customer Id', :id
    column :email
    column :created_at
    column :sign_in_count
    column "orders" do
      strong {link_to "Previous Orders"}
    end
    actions
  end

end
