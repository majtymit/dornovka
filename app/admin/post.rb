ActiveAdmin.register Post do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :title, :description, :text,  :image_url, :format, :category_id, :happened_at, :date, :impressionist_count, :created_at, :updated_at


  index do
    selectable_column
    column :title
    column :text
    column :image_url
    column :created_at
    column "kategória", :category
    column :impressionist_count
    actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :text
      row :image_url
      row :format
      row "kategória", :category
      row :happened_at
      row :date
      row :impressionist_count
      row :created_at
      row :updated_at
      row :subpost
    end
  end

  #sidebar "Details", only: :show do
    #attributes_table_for post do
      #row :title
      #row :text
      #row :category
    #end
  #end
end

