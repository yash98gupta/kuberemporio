ActiveAdmin.register Article do

 permit_params :description, :price, :ratings,:quantity, :name, :company,:discount, :colour, :weight, :height, :material, :articleimg, :articleimg1, :articleimg2, :articleimg3, :articleimg4
# permit params is for only updating the permited params

 filter :id
 filter :name
 filter :company
 filter :price, as: :numeric_range_filter
 filter :ratings
 filter :discount

 form html: { multipart: true } do |f|
  f.inputs 'Details' do
      f.input :name
      f.input :company, label: "company"
      f.input :price
      f.input :quantity
      f.input :material
      f.input :discount
      f.input :colour
      f.input :weight
      f.input :height
      f.input :description
      f.inputs 'Images' do
          para "Upload main view of the picture"
          f.input :articleimg, as: :file
          para "Upload side views of the picture"
          f.input :articleimg1, label:"side view 1"
          f.input :articleimg2, label:"side view 2"
          f.input :articleimg3, label:"side view 3"
          f.input :articleimg4, label:"side view 4"
      end
  end
    actions
  end

  index do
    selectable_column
    column 'Article Id', :id
    # column "Image" do |article|
    #   image_tag(article.articleimg.url(:thumb))
    # end
    image_column 'Image', :articleimg, style: :thumb
    column :name
    column :company
    column :price
    column :ratings
    actions
  end

  show do
    # render partial: 'admin/item', locals: {ar: @article_all}
  attributes_table do
  image_row 'Image', :articleimg, style: :medium
  image_row 'Side View 1', :articleimg1, style: :thumb
  image_row 'Side View 2', :articleimg2, style: :thumb
  image_row 'Side View 3', :articleimg3, style: :thumb
  image_row 'Side View 4', :articleimg4, style: :thumb
  row :name
  row :company, label: "company"
  row :price
  row :quantity
  row :material
  row :discount
  row :colour
  row :weight
  row :height
  row :description
  end
end

end
