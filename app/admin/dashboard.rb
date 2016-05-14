ActiveAdmin.register_page "Dashboard" do

  ActiveAdmin.setup do |config|
    config.comments = false
  end

  menu priority: 1, label: "Prehľad"

  content title: "Dashboard" do
    columns do
      column do
        panel "Posledné upravované posty v blogu" do
          table_for Post.order(created_at: :desc).limit(5).each do |post|
            column "Viditeľnost", :visibility do |post|
              if post.visibility
                link_to image_tag("yes.png", height: "25"), edit_admin_post_path(post)
              else
                link_to image_tag("no.png", height: "25"), edit_admin_post_path(post)
              end
            end
            column "Názov", :title
            column "Obrázok", :image do |post|
              link_to image_tag(post.image.url, height: "35"), edit_admin_post_path(post)
            end
            column "Vytvorené", :created_at
          end
        end
        panel "asdkljaslkd" do
        end
      end

      column do
        panel "qwe asd asdasd" do
        end
      end

      column do
        div do
          br
          text_node %{<iframe src="https://rpm.newrelic.com/public/charts/6VooNO2hKWB" width="500" height="300" scrolling="no" frameborder="no"></iframe>}.html_safe
        end
      end

    end # columns



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
