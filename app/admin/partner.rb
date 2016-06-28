ActiveAdmin.register Partner do

  menu priority: 8, label: "Partneri"

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

  permit_params :visibility, :position, :name, :description, :contact, :link, :logo, :impressionist_count, :created_at, :updated_at

  config.filters = false
  config.batch_actions = true
  config.sort_order = 'position_asc'

  index do
    selectable_column
      column "Zverejnené", :visibility, sortable: :position do |partner|
        if partner.visibility
          link_to image_tag("yes.png", height: "50"), edit_admin_partner_path(partner)
        else
          link_to image_tag("no.png", height: "50"), edit_admin_partner_path(partner)
        end
      end
      column "Pozícia", :position, sortable: :position
      column "Meno", :name, sortable: :name
      column "Popis", sortable: :description do |partner|
        partner.description
      end
      column "Kontakt", :contact, sortable: :contact
      column "Kliky", :impressionist_count
      column "Link", sortable: :link do |partner|
        partner.link.truncate(60, separator: /\s/)
      end
      column "Logo" do |partner|
        link_to image_tag(partner.logo.url, height: "50"), edit_admin_partner_path(partner)
      end
      column "Vytvorené", sortable: :created_at do |partner|
        partner.created_at.localtime.strftime("%d.%m.%Y<br />%H:%M:%S").html_safe
      end
      actions
  end

  show do
    attributes_table do
      row "zverejnený" do
        if partner.visibility
          link_to image_tag("yes.png", height: "50"), edit_admin_partner_path(partner)
        else
          link_to image_tag("no.png", height: "50"), edit_admin_partner_path(partner)
        end
      end
      row "pozícia" do partner.position; end
      row "meno" do partner.name; end
      row "krátky popis" do partner.description; end
      row "kontakt" do partner.contact; end
      row "link" do partner.link; end
      row "logo" do
        link_to image_tag(partner.logo.url), edit_admin_partner_path(partner)
      end
      row "kliky" do partner.impressionist_count; end
      row "vytvorený" do
        partner.created_at.localtime.strftime("%d.%m.%Y, %H:%M:%S")
      end
      row "editovaný" do
        partner.updated_at.localtime.strftime("%d.%m.%Y, %H:%M:%S")
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :visibility, label: "Zverejnený", input_html: {checked: true}
      f.input :position, label: "Pozícia"
      f.input :name, label: "Meno", required: true
      f.input :description, label: "Krátky popis", required: true
      f.input :contact, label: "Kontakt", required: true
      f.input :link, label: "Link", required: true
      f.input :logo, label: "Logo", required: true, as: :file, hint: image_tag(f.object.logo.url)
    end
    f.actions
  end

end
