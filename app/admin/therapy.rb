ActiveAdmin.register Therapy do

  menu priority: 10, label: "Metódy"

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
    @therapy = resource.dup
    render :new, layout: false
  end

  permit_params :visibility, :position, :title, :text, :description, :picture1, :picture2, :picture3, :picture1desc, :picture2desc, :picture3desc, :created_at, :updated_at

  config.filters = false
  config.batch_actions = true
  config.sort_order = 'position_asc'

  index do
    selectable_column
      column "Zverejnené", :visibility, sortable: :position do |therapy|
        if therapy.visibility
          link_to image_tag("yes.png", height: "50"), edit_admin_therapy_path(therapy)
        else
          link_to image_tag("no.png", height: "50"), edit_admin_therapy_path(therapy)
        end
      end
      column "Pozícia", :position, sortable: :position
      column "Názov", :title, sortable: :title
      column "Obrázok 1" do |therapy|
        link_to image_tag(therapy.picture1.url, height: "50"), edit_admin_therapy_path(therapy)
      end
      column "Obrázok 2" do |therapy|
        link_to image_tag(therapy.picture2.url, height: "50"), edit_admin_therapy_path(therapy)
      end
      column "Obrázok 3" do |therapy|
        link_to image_tag(therapy.picture3.url, height: "50"), edit_admin_therapy_path(therapy)
      end
      column "Vytvorené", sortable: :created_at do |therapy|
        therapy.created_at.localtime.strftime("%d.%m.%Y<br />%H:%M:%S").html_safe
      end
      actions defaults: true do |therapy|
        link_to("Copy", copy_admin_therapy_path(therapy))
      end
  end

  show do
    attributes_table do
      row "zverejnený" do
        if therapy.visibility
          link_to image_tag("yes.png", height: "50"), edit_admin_therapy_path(therapy)
        else
          link_to image_tag("no.png", height: "50"), edit_admin_therapy_path(therapy)
        end
      end
      row "pozícia" do therapy.position; end
      row "názov" do therapy.title; end
      row "text" do therapy.text.html_safe; end
      row "opis" do therapy.description.html_safe; end
      row "picture1" do
        link_to image_tag(therapy.picture1.url), edit_admin_therapy_path(therapy)
      end
      row "picture2" do
        link_to image_tag(therapy.picture2.url), edit_admin_therapy_path(therapy)
      end
      row "picture3" do
        link_to image_tag(therapy.picture3.url), edit_admin_therapy_path(therapy)
      end
      row "kliky" do therapy.impressionist_count; end
      row "vytvorený" do
        therapy.created_at.localtime.strftime("%d.%m.%Y, %H:%M:%S")
      end
      row "editovaný" do
        therapy.updated_at.localtime.strftime("%d.%m.%Y, %H:%M:%S")
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :visibility, label: "Zverejnený", input_html: {checked: true}
      f.input :position, label: "Pozícia"
      f.input :title, label: "Názov", required: true
      f.input :description, label: "Opis", required: true, as: :rich, config: { height: "100px" }
      f.input :text, label: "Text", required: true, as: :rich, config: { height: "200px" }
      f.input :picture1, label: "Logo<br /><span style='color: red; font-size: 20px;'>283px šírka a 117px výška<br />žiadny iný rozmer!</span>".html_safe, required: true, as: :file, hint: image_tag(f.object.picture1.url)
      f.input :picture1desc, label: "Obrázok 1 opis"
      f.input :picture2, label: "Logo<br /><span style='color: red; font-size: 20px;'>283px šírka a 117px výška<br />žiadny iný rozmer!</span>".html_safe, required: true, as: :file, hint: image_tag(f.object.picture2.url)
      f.input :picture2desc, label: "Obrázok 2 opis"
      f.input :picture3, label: "Logo<br /><span style='color: red; font-size: 20px;'>283px šírka a 117px výška<br />žiadny iný rozmer!</span>".html_safe, required: true, as: :file, hint: image_tag(f.object.picture3.url)
      f.input :picture3desc, label: "Obrázok 3 opis"
    end
    f.actions
  end

end
