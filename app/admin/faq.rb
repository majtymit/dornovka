ActiveAdmin.register Faq do

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

  permit_params :visibility, :position, :active, :title, :text, :created_at, :updated_at

  config.filters = false
  config.batch_actions = true
  config.sort_order = 'position_asc'

  index do
    selectable_column
      column "Viditeľnosť", :visibility, sortable: :position do |faq|
        if faq.visibility == "yes"
          link_to image_tag("yes.png", height: "50"), edit_admin_faq_path(faq)
        else
          link_to image_tag("no.png", height: "50"), edit_admin_faq_path(faq)
        end
      end
      column "Pozícia", :position, sortable: :position
      column "Otvorené", :active, sortable: :active do |faq|
        if faq.active == "active"
          link_to image_tag("yes.png", height: "25"), edit_admin_faq_path(faq)
        end
      end
      column "Názov", :title, sortable: :title
      column "Text", sortable: :text, :class => "aa-text_and_name_column" do |faq|
        faq.text.truncate(60, separator: /\s/).html_safe
      end
      column "Vytvorené", sortable: :created_at do |faq|
        faq.created_at.localtime.strftime("%d.%m.%Y<br />%H:%M:%S").html_safe
      end
      actions
  end

  show do
    attributes_table do
      row "viditeľosť" do
        if faq.visibility == "yes"
          link_to image_tag("yes.png", height: "50"), edit_admin_faq_path(faq)
        else
          link_to image_tag("no.png", height: "50"), edit_admin_faq_path(faq)
        end
      end
      row "pozícia" do faq.position; end
      row "otvorené" do
        if faq.active == "active"
          image_tag("yes.png", height: "25")
        else
          p 'nie'
        end
      end
      row "názov" do faq.title; end
      row "text" do faq.text; end
      row "vytvorené" do
        faq.created_at.localtime.strftime("%d.%m.%Y, %H:%M:%S")
      end
      row "editované" do
        faq.updated_at.localtime.strftime("%d.%m.%Y, %H:%M:%S")
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :visibility, label: "Viditeľnosť", include_blank: false, as: :select, collection: [['áno', 'yes'], ['nie', 'no']]
      f.input :position, label: "Pozícia"
      f.input :active, label: "Otvorené", include_blank: false, as: :select, collection: [['nie', ''], ['áno', 'active']]
      f.input :title, label: "Názov", required: true
      f.input :text, label: "Krátky popis", required: true, as: :rich, :config => { :height => '200px' }
    end
    f.actions
  end

end
