class Figure < ActiveRecord::Base
  validates :position, uniqueness: true, numericality: :true
  scope :visible, -> { where(visibility: true) }

  has_attached_file :photo,
    default_url: "/assets/original/portfolio-demo.gif",
    url: ":s3_domain_url",
    path: "public/admin/figures/:id_:basename.:extension",
    storage: :fog,
    fog_credentials: {
        provider: 'AWS',
        region: 'eu-central-1',
        aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
    },
    fog_directory: ENV["FOG_DIRECTORY"]

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end