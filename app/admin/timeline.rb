ActiveAdmin.register Timeline do

  menu priority: 7, label: "Životopis"

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

  config.filters = false
  permit_params :visibility, :position, :date, :status, :icon, :description, :created_at, :updated_at

  index do
    selectable_column
      column "Zverejnené", :visibility, sortable: :visibility do |timeline|
        if timeline.visibility
          link_to image_tag("yes.png", height: "50"), edit_admin_timeline_path(timeline)
        else
          link_to image_tag("no.png", height: "50"), edit_admin_timeline_path(timeline)
        end
      end
      column "Pozícia", sortable: :position do |timeline|
        timeline.position
      end
      column "Dátum", :date, sortable: :date do |timeline|
        timeline.date
      end
      column "Status", :status, sortable: :status do |timeline|
        timeline.status
      end
      column "Ikona", :icon, sortable: :icon do |timeline|
      case timeline.icon
        when "graduation-cap" then "kurz"
        when "book" then "kniha"
        when "hospital-o" then "nemocnica"
        when "thumbs-up" then "palec hore"
        when "institution" then "inštitúcia"
        when "paw" then "labka"
        else ""
        end
      end
      column "Popis", sortable: :description, :class => "aa-text_and_name_column" do |timeline|
        timeline.description.truncate(80, separator: /\s/)
      end
      column "Vytvorené", sortable: :created_at do |timeline|
        timeline.created_at.localtime.strftime("%d.%m.%Y<br />%H:%M:%S").html_safe
      end
      actions
  end

  show do
    attributes_table do
      row "zverejnený" do
        if timeline.visibility
          link_to image_tag("yes.png", height: "50"), edit_admin_timeline_path(timeline)
        else
          link_to image_tag("no.png", height: "50"), edit_admin_timeline_path(timeline)
        end
      end
      row "pozícia" do timeline.position; end
      row "dátum" do timeline.date; end
      row "status" do timeline.status; end
      row "Ikona" do
      case timeline.icon
        when "graduation-cap" then "kurz"
        when "book" then "kniha"
        when "hospital-o" then "nemocnica"
        when "thumbs-up" then "palec hore"
        when "institution" then "inštitúcia"
        when "paw" then "labka"
        else ""
        end
      end
      row "popis" do timeline.description; end
      row "vytvorené" do
        timeline.created_at.localtime.strftime("%d.%m.%Y, %H:%M:%S")
      end
      row "editované" do
        timeline.updated_at.localtime.strftime("%d.%m.%Y, %H:%M:%S")
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :visibility, label: "Zverejnený", input_html: {checked: true}
      f.input :position, label: "Pozícia"
      f.input :date, label: "Dátum"
      f.input :status, label: "Status"
      f.input :icon, label: "Ikona", required: true, include_blank: false, as: :select, collection: [['kurz', 'graduation-cap'], ['kniha', 'book'], ['nemocnica', 'hospital-o'], ['palec hore', 'thumbs-up'], ['inštitúcia', 'institution'], ['labka', 'paw']]
      f.input :description, label: "Popis", required: true
    end
    f.actions
  end

end

