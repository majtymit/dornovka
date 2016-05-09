ActiveAdmin.register Certificate do

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

  permit_params :visibility, :position, :title, :description, :image, :created_at, :updated_at

  config.filters = false
  config.batch_actions = true
  config.sort_order = 'position_asc'
  #config.per_page = 10
  #filter :name_or_description, as: :string


  index do
    selectable_column
      column "Viditeľnosť", :visibility, sortable: :position do |certificate|
        if certificate.visibility == "yes"
          link_to image_tag("yes.png", height: "50"), edit_admin_certificate_path(certificate)
        else
          link_to image_tag("no.png", height: "50"), edit_admin_certificate_path(certificate)
        end
      end
      column "Pozícia", :position, sortable: :position
      column "Názov", :title, sortable: :title
      #column "Popis", sortable: :description do |certificate|
        #certificate.description
      #end
      column "Obrázok" do |certificate|
        link_to image_tag("#{certificate.image.url}", height: "50"), edit_admin_certificate_path(certificate)
      end
      column "Vytvorené", sortable: :created_at do |certificate|
        certificate.created_at.localtime.strftime("%d.%m.%Y<br />%H:%M:%S").html_safe
      end
      actions
  end

  show do
    attributes_table do
      row "viditeľosť" do
        if certificate.visibility == "yes"
          link_to image_tag("yes.png", height: "50"), edit_admin_certificate_path(certificate)
        else
          link_to image_tag("no.png", height: "50"), edit_admin_certificate_path(certificate)
        end
      end
      row "pozícia" do certificate.position; end
      row "názov" do certificate.title; end
      #row "krátky popis" do certificate.description; end
      row "obrázok" do
        link_to image_tag("#{certificate.image.url}"), edit_admin_certificate_path(certificate)
      end
      row "vytvorené" do
        certificate.created_at.localtime.strftime("%d.%m.%Y, %H:%M:%S")
      end
      row "editované" do
        certificate.updated_at.localtime.strftime("%d.%m.%Y, %H:%M:%S")
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :visibility, label: "Viditeľnosť", include_blank: false, as: :select, collection: [['áno', 'yes'], ['nie', 'no']]
      f.input :position, label: "Pozícia"
      f.input :title, label: "Názov", required: true
      #f.input :description, label: "Krátky popis", required: true
      f.input :image, label: "Obrázok", required: true, :as => :file, :hint => image_tag(f.object.image.url)
    end
    f.actions
  end



end
