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

  permit_params :answered, :email, :subject, :message, :created_at, :updated_at
end
