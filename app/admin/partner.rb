ActiveAdmin.register Partner do

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
  permit_params :position, :name, :description, :contact, :link, :logo, :impressionist_count, :created_at, :updated_at

  config.batch_actions = true
  config.sort_order = 'position_asc'
  #config.per_page = 10
  filter :name_or_description, as: :string


  index do
    selectable_column
      column "Pozícia", :position, sortable: :position
      column "Meno", sortable: :name do |partner|
        link_to partner.name, edit_admin_partner_path(partner)
      end
      column "Popis", sortable: :description do |partner|
        partner.description
      end
      column "Kontakt", :contact, sortable: :contact
      column "Kliky", :impressionist_count
      column "Link", :link, sortable: :link
      column "Logo" do |partner|
        link_to image_tag("#{partner.logo.url}", height: "50"), admin_partner_path(partner)
      end
      column "Vytvorené", sortable: :created_at do |partner|
        partner.created_at.localtime.strftime("%d %B %Y")
      end
      actions
  end

  show do
    attributes_table do
      row "pozícia" do partner.position; end
      row "meno" do partner.name; end
      row "krátky popis" do partner.description; end
      row "kontakt" do partner.contact; end
      row "link" do partner.link; end
      row "logo" do
        image_tag("#{partner.logo.url}")
      end
      row "kliky" do partner.impressionist_count; end
      row "vytvorené" do
        partner.created_at.localtime.strftime("%d %B %Y, %H:%M")
      end
      row "editované" do
        partner.updated_at.localtime.strftime("%d %B %Y, %H:%M")
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :position, label: "Pozícia", required: true
      f.input :name, label: "Meno", required: true
      f.input :description, label: "Krátky popis", required: true
      f.input :contact, label: "Kontakt", required: true
      f.input :link, label: "Link", required: true
      f.input :logo, label: "Logo<br /><span style='color: red; font-size: 20px;'>283px šírka a 117px výška<br />žiadny iný rozmer!</span>".html_safe, required: true, :as => :file, :hint => image_tag(f.object.logo.url)
      f.input :created_at, label: "Vytvorené"
    end
    f.actions
  end



end
