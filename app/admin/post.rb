ActiveAdmin.register Post do

  menu priority: 6, label: "Blog"

  controller do
    def create
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end

    def update
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end
  end

  member_action :copy, method: :get do
    @post = resource.dup
    render :new, layout: false
  end

  config.sort_order = 'created_at_desc'
  #config.per_page = 30
  filter :title
  filter :text
  filter :title_or_text, as: :string
  filter :format, as: :select, collection: [['článok', 'article'], 'status']
  filter :category, as: :select, collection: [['psy', 'dogs'], ['kone', 'horses'], ['mačky','cats'], ['malé zvieratá', 'small_pets'], ['udalosti', 'events'], ['statusy', 'status'], ['metódy', 'methods'], ['choroby', 'illness']]
  filter :created_at

  scope "Všetky", :all, default: true
  scope "Články", :article do |posts|
    posts.where(format: 'article')
  end
  scope "Statusy", :status do |posts|
    posts.where(format: 'status')
  end
  scope "Nezverejnené", :visibility do |posts|
    posts.where(visibility: 'no')
  end
  scope "Zvýraznené", :featured do |posts|
    posts.where(featured: true)
  end
  scope "Dnes", :today do |posts|
    posts.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end
  scope "Posledné", :lastones do |posts|
    posts.where(id: posts.order(updated_at: :desc).limit(5).pluck(:id))
  end

  permit_params :id, :visibility, :title, :description, :text, :format, :category, :featured, :happened_at, :impressionist_count, :created_at, :updated_at, blogpictures_attributes: [:id, :_destroy, :picture]

  index do
    selectable_column
      column "ID", :id
      column "Zverejnené", :visibility, sortable: :visibility do |post|
        if post.visibility
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
      column "Formát", :format, sortable: :format do |post|
        post.format_sk
      end
      column "Kategória", :category, sortable: :category do |post|
        post.category_sk
      end
      column "Zvýraznené", :featured, sortable: :featured do |post|
        if post.featured
          link_to image_tag("yes.png", height: "25"), edit_admin_post_path(post)
        end
      end
      column "Kliky", :impressionist_count
      #column "Obrázok", sortable: :image do |post|
      #  link_to image_tag(post.image.url, height: "50"), edit_admin_post_path(post)
      #end
      column "Vytvorené", sortable: :created_at do |post|
        post.created_at.localtime.strftime("%d.%m.%Y<br />%H:%M:%S").html_safe
      end
      actions defaults: true do |post|
        link_to("Copy", copy_admin_post_path(post))
      end
  end

  show do
    attributes_table do
      row :id
      row "zverejnený" do
        if post.visibility
          link_to image_tag("yes.png", height: "50"), edit_admin_post_path(post)
        else
          link_to image_tag("no.png", height: "50"), edit_admin_post_path(post)
        end
      end
      row "názov" do post.title; end
      row "krátky popis" do post.description; end
      row "text" do post.text.html_safe; end
      #row "obrázok" do
      #  link_to image_tag(post.image.url, height: "300"), edit_admin_post_path(post)
      #end
      row "formát" do post.format_sk; end
      row "kategória" do post.category_sk; end
      row "zvýraznený" do
        if post.featured
          image_tag("yes.png", height: "25")
        else
          p 'nie'
        end
      end
      row "videnia" do post.impressionist_count; end
      row "dátum" do post.created_at.strftime("%a %b %d %Y %H:%M:%S"); end
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
      f.input :visibility, label: "Zverejnený"#, input_html: {checked: true}, include_blank: false, as: :select, collection: [['áno', true], ['nie', false]]
      f.input :title, required: true, label: "Názov"
      f.input :description, required: true, label: "Krátky popis"
      f.input :text, required: true, label: "Text", as: :rich, config: { height: "200px" }
      f.has_many :blogpictures do |ff|
        ff.input :picture, required: false, as: :file, hint: image_tag(ff.object.picture.url, height: "300")
        ff.input :_destroy, as: :boolean
      end
      #f.input :image, required: true, as: :file, hint: image_tag(f.object.image.url, height: "300")
      f.input :format, required: true, label: "Formát", include_blank: false, as: :select, collection: [['článok', 'article'], 'status'] #Post.distinct.pluck(:format).map { |f| [f, f] }.reverse
      f.input :category, required: true, label: "Kategória", include_blank: false, as: :select , collection: [['psy', 'dogs'], ['kone', 'horses'], ['mačky','cats'], ['malé zvieratá', 'small_pets'], ['udalosti', 'events'], ['statusy', 'status'], ['metódy', 'methods'], ['choroby', 'illness']]
      f.input :featured, label: "Zvýraznený"
      f.input :created_at, label: "Vytvorený"
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

  #sidebar :nieco, except: :index do
  #  attributes_table_for resource do
  #  end
  #end
end