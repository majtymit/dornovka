class Blogpicture < ActiveRecord::Base
  belongs_to :post
  has_attached_file :picture,
    default_url: "/assets/original/portfolio-demo.gif",
    url: ":s3_domain_url",
    path: "public/admin/posts/:id/:basename.:extension",
    storage: :fog,
    fog_credentials: {
        provider: 'AWS',
        region: 'eu-central-1',
        aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
    },
    fog_directory: ENV["FOG_DIRECTORY"]

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
