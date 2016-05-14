ActiveAdmin.register Figure do

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
  menu priority: 8, label: "Banner"

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

  permit_params :visibility, :position, :description, :link, :photo, :created_at, :updated_at

  config.filters = false
  config.batch_actions = true
  config.sort_order = 'position_asc'

  index do
    selectable_column
      column "Zverejnené", :visibility, sortable: :position do |figure|
        if figure.visibility
          link_to image_tag("yes.png", height: "50"), edit_admin_figure_path(figure)
        else
          link_to image_tag("no.png", height: "50"), edit_admin_figure_path(figure)
        end
      end
      column "Pozícia", :position, sortable: :position
      column "Popis", :description, sortable: :position do |figure|
        figure.description.truncate(80, separator: /\s/)
      end
      column "Obrázok" do |figure|
        link_to image_tag(figure.photo.url, height: "50"), edit_admin_figure_path(figure)
      end
      column "Vytvorené", sortable: :created_at do |figure|
        figure.created_at.localtime.strftime("%d.%m.%Y<br />%H:%M:%S").html_safe
      end
      actions
  end

  show do
    attributes_table do
      row "zverejnený" do |figure|
        if figure.visibility
          link_to image_tag("yes.png", height: "50"), edit_admin_figure_path(figure)
        else
          link_to image_tag("no.png", height: "50"), edit_admin_figure_path(figure)
        end
      end
      row "pozícia" do |figure|
        figure.position
      end
      row "obrázok" do |figure|
        link_to image_tag(figure.photo.url), edit_admin_figure_path(figure)
      end
      row "popis" do |figure|
        figure.description
      end
      row "vytvorený" do |figure|
        figure.created_at.localtime.strftime("%d.%m.%Y, %H:%M:%S")
      end
      row "editovaný" do |figure|
        figure.updated_at.localtime.strftime("%d.%m.%Y, %H:%M:%S")
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :visibility, label: "Zverejnený", input_html: {checked: true}
      f.input :position, label: "Pozícia"
      f.input :photo, label: "Obrázok", required: true, :as => :file, :hint => image_tag(f.object.photo.url)
      f.input :description, label: "Popis"
    end
    f.actions
  end

end