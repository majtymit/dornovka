ActiveAdmin.register_page "Dashboard" do

  ActiveAdmin.setup do |config|
    config.comments = false
  end

  menu priority: 2, label: "Prehľad"

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
            column "Obrázok" do |post|
              if post.blogpictures.count > 0
                link_to image_tag(post.blogpictures[0].picture.url, height: "50"), edit_admin_post_path(post)
              end
            end
            column "Vytvorené", :created_at do |post|
              post.created_at.localtime.strftime("%d.%m.%Y<br />%H:%M:%S").html_safe
            end
          end
        end
        panel "hocico" do
        end
      end

      column do
        panel "Najnavštevovanejšie posty" do
          table_for Post.most_visited.limit(5).each do |post|
            column "Kliky", :visits
            column "Názov", :title
            column "Obrázok" do |post|
              if post.blogpictures.count > 0
                link_to image_tag(post.blogpictures[0].picture.url, height: "50"), edit_admin_post_path(post)
              end
            end
            column "Vytvorené", :created_at do |post|
              post.created_at.localtime.strftime("%d.%m.%Y<br />%H:%M:%S").html_safe
            end
          end
        end
      end

      column do
        panel "Posledné e-maily" do
          table_for Contact.order(created_at: :desc).limit(5).each do |contact|
            column "Vybavené", :answered do |contact|
              if contact.answered
                link_to image_tag("yes.png", height: "25"), edit_admin_contact_path(contact)
              else
                link_to image_tag("no.png", height: "25"), edit_admin_contact_path(contact)
              end
            end
            column "Odosielateľ", :email
            column "Predmet", :subject
            column "Vytvorené", :created_at do |contact|
              contact.created_at.localtime.strftime("%d.%m.%Y<br />%H:%M:%S").html_safe
            end
          end
        end
      end

    end
  end
end
