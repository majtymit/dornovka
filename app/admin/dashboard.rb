ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    section "Najnovšie články" do
        table_for Post.order("updated_at desc").limit(5) do
            column :title do |post|
                link_to post.title, admin_post_path(post)
            end
            column :category
        end
        strong { link_to "Všetky články", admin_posts_path }
    end
    br
    br
    br
    br
    section "Najnovší partneri" do
        table_for Partner.order("updated_at desc").limit(5) do
            column :name do |partner|
                link_to partner.name, admin_partner_path(partner)
            end
        end
        strong { link_to "Všetci partneri", admin_partners_path }
    end
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end



    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
