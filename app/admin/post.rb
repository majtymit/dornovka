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

  permit_params :title, :description, :text, :image, :format, :category_id, :happened_at, :date, :impressionist_count, :created_at, :updated_at

  config.sort_order = 'created_at_desc'
  #config.per_page = 10
  filter :title
  filter :text
  filter :title_or_text, as: :string
  filter :format, as: :select
  filter :category, as: :select
  filter :created_at

  index do
    selectable_column
      column :id
      column "Názov", sortable: :title do |post|
        link_to post.title, edit_admin_post_path(post)
      end
      column "Text", sortable: :text do |post|
        post.text.truncate(60, separator: /\s/).html_safe
      end
      column "Formát", :format, sortable: :format
      column "Kategória", :category_id, sortable: :category_id
      #column "Kategória" do |post|
        #post.category.sk_name
      #end
      column "Kliky", :impressionist_count
      column "Obrázok", sortable: :image do |post|
        link_to image_tag("#{post.image.url}", height: "50"), admin_post_path(post)
      end
      column "Vytvorené", sortable: :created_at do |post|
        post.created_at.localtime.strftime("%d %B %Y")
      end
      #column "Upravené", sortable: :updated_at do |post|
        #post.updated_at.localtime.strftime("%d %B %Y")
      #end
      actions
  end

  show do
    attributes_table do
      row :id
      row "názov" do post.title; end
      row "krátky popis" do post.description; end
      row "text" do post.text.html_safe; end
      row "obrázok" do
        image_tag("#{post.image.url}", height: "300")
      end
      row "formát" do post.format; end
      row "kategória" do post.category.name; end
      #row :happened_at
      row "dátum" do post.date; end
      row "videnia" do post.impressionist_count; end
      row "vytvorené" do
        post.created_at.localtime.strftime("%d %B %Y, %H:%M")
      end
      row "editované" do
        post.updated_at.localtime.strftime("%d %B %Y, %H:%M")
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :title, required: true, label: "Názov"
      f.input :description, label: "Krátky popis"
      f.input :text, label: "Text", as: :rich, :config => { :height => '200px' }
      f.input :image, :as => :file, :hint => image_tag(f.object.image.url, height: "300")
      f.input :format, required: true, label: "Formát", include_blank: false, as: :select, collection: Post.distinct.pluck(:format).map { |f| [f, f] }
      f.input :category, required: true, label: "Kategória", include_blank: false #, as: :select, collection: Post.all.map {|post| post.category.sk_name}.uniq
      #f.input :impressionist_count, label: "Videnia"
      f.input :date, required: true, label: "Dátum"
      f.input :created_at, label: "Vytvorené"
    end
    f.actions
  end

  scope "Všetky", :all, default: true
  scope "Article", :article do |posts|
    posts.where(format: 'article')
  end
  scope "Status", :status do |posts|
    posts.where(format: 'status')
  end
  scope "Dnes", :today do |posts|
    posts.where(created_at: Date.today)
  end
  scope "Posledné", :lastones do |posts|
    posts.where(id: posts.order(updated_at: :desc).limit(5).pluck(:id))
  end

  #sidebar "Details", only: :show do
    #attributes_table_for post do
      #row :title
      #row :text
      #row :category
    #end
  #end
end

