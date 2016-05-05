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

  permit_params :id, :visibility, :title, :description, :text, :image, :format, :category_id, :featured, :happened_at, :date, :impressionist_count, :created_at, :updated_at

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
      column "ID", :id
      column "Viditeľnosť", :visibility, sortable: :visibility do |post|
        if post.visibility == "yes"
          link_to image_tag("yes.png", height: "50"), edit_admin_post_path(post)
        else
          link_to image_tag("no.png", height: "50"), edit_admin_post_path(post)
        end
      end
      column "Názov", sortable: :title, :class => "aa-text_and_name_column" do |post|
        post.title
      end
      column "Text", sortable: :text, :class => "aa-text_and_name_column" do |post|
        post.text.truncate(60, separator: /\s/).html_safe
      end
      column "Formát", :format, sortable: :format
      column "Kategória", :category_id, sortable: :category_id
      #column "Kategória" do |post|
        #post.category.sk_name
      #end
      column "Dôležitosť", :featured, sortable: :featured do |post|
        if post.featured == "featured"
          link_to image_tag("yes.png", height: "25"), edit_admin_post_path(post)
        end
      end
      column "Kliky", :impressionist_count
      column "Obrázok", sortable: :image do |post|
        link_to image_tag("#{post.image.url}", height: "50"), edit_admin_post_path(post)
      end
      column "Vytvorené", sortable: :created_at do |post|
        post.created_at.localtime.strftime("%d.%m.%Y<br />%H:%M:%S").html_safe
      end
      #column "Upravené", sortable: :updated_at do |post|
        #post.updated_at.localtime.strftime("%d %B %Y")
      #end
      actions
  end

  show do
    attributes_table do
      row :id
      row "viditeľosť" do
        if post.visibility == "yes"
          link_to image_tag("yes.png", height: "50"), edit_admin_post_path(post)
        else
          link_to image_tag("no.png", height: "50"), edit_admin_post_path(post)
        end
      end
      row "názov" do post.title; end
      row "krátky popis" do post.description; end
      row "text" do post.text.html_safe; end
      row "obrázok" do
        image_tag("#{post.image.url}", height: "300")
      end
      row "formát" do post.format; end
      row "kategória" do post.category.name; end
      row "dôležitosť" do
        if post.featured == "featured"
          image_tag("yes.png", height: "25")
        end
      end
      row "dátum" do post.date; end
      row "videnia" do post.impressionist_count; end
      row "vytvorené" do
        post.created_at.localtime.strftime("%d.%m.%Y, %H:%M:%S")
      end
      row "editované" do
        post.updated_at.localtime.strftime("%d.%m.%Y, %H:%M:%S")
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :visibility, label: "Viditeľnosť", include_blank: false, as: :select, collection: ['yes', 'no']
      f.input :title, required: true, label: "Názov"
      f.input :description, required: true, label: "Krátky popis"
      f.input :text, required: true, label: "Text", as: :rich, :config => { :height => '200px' }
      f.input :image, required: true, :as => :file, :hint => image_tag(f.object.image.url, height: "300")
      f.input :format, required: true, label: "Formát", include_blank: false, as: :select, collection: Post.distinct.pluck(:format).map { |f| [f, f] }.reverse
      f.input :category, required: true, label: "Kategória", include_blank: false #, as: :select, collection: Post.all.map {|post| post.category.sk_name}.uniq
      #f.input :impressionist_count, label: "Videnia"
      f.input :featured, label: "Zvýraznené", include_blank: false, as: :select, collection: ['none','featured']
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

