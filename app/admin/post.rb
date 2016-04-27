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

  config.sort_order = 'created_at_desc'
  #config.per_page = 10
  filter :title
  filter :text
  filter :title_or_text, :as => :string
  filter :format, :as => :select
  filter :category
  filter :created_at

  index do
    selectable_column
      column "Názov", :title
      column "Text" do |post|
        post.text.truncate(60, separator: /\s/)
      end
      column "Formát", :format
      column "Kategória", :category
      #column "Kategória" do |post|
        #post.category.sk_name
      #end
      column "Kliky", :impressionist_count
      column "Obrázok", :image_url
      column "Vytvorené", :created_at
      actions
  end

  show do
    attributes_table do
      row "názov" do post.title; end
      row "krátky popis" do post.description; end
      row "text" do post.text; end
      row "obrázok" do post.image_url; end
      row "formát" do post.format; end
      row "kategória" do post.category.name; end
      #row :happened_at
      row "dátum" do post.date; end
      row "videnia" do post.impressionist_count; end
      row "vytvorené" do post.created_at; end
      row "editované" do post.updated_at; end
    end
  end

  form do |f|
    f.inputs do
      f.input :title, :label => "Názov"
      f.input :description, :label => "Krátky popis"
      f.input :text, :label => "Text"
      f.input :image_url, :label => "Obrázok", :as => :file, :hint => image_tag("blog/#{f.object.image_url}", :height => "200")
      f.input :format, :label => "Formát", :include_blank => false, :as => :select, :collection => Post.distinct.pluck(:format).map { |f| [f, f] }
      f.input :category, :label => "Kategória", :include_blank => false #, :as => :select, :collection => Post.all.map {|post| post.category.sk_name}.uniq
      #f.input :impressionist_count, :label => "Videnia"
      f.input :date, :label => "Dátum"
      f.input :created_at, :label => "Vytvorené"
    end
    f.actions
  end

  #sidebar "Details", only: :show do
    #attributes_table_for post do
      #row :title
      #row :text
      #row :category
    #end
  #end
end

