ActiveAdmin.register Contact do

  menu priority: 9, label: "Emaily"
  config.per_page = 50

  controller do
    def create
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end

    def update
      super do |format|
        redirect_to admin_dashboard_path and return if resource.valid?
      end
    end
  end

  permit_params :answered

  index do
    selectable_column
      column "Vybavené", :answered, sortable: :answered
      column "Od", :email, sortable: :email
      column "Predmet", :subject, sortable: :subject
      column "Správa", sortable: :message, :class => "aa-text_and_name_column" do |contact|
        contact.message.truncate(60, separator: /\s/).html_safe
      end
      column "Vytvorené", sortable: :created_at do |contact|
        contact.created_at.localtime.strftime("%d.%m.%Y<br />%H:%M:%S").html_safe
      end
      actions
  end

end
